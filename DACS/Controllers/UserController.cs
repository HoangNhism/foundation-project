
using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace DACS.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;
        private readonly ILogger<EpisodeController> _logger;
        public UserController(IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo, ILogger<EpisodeController> logger)
        {
            _podcastRepo = podcastRepo;
            _context = context;
            _episodeRepo = episodeRepo;
            _topicRepo = topicRepo;
            _logger = logger;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult CreatePodcast()
        {
            ViewData["Topics"] = new SelectList(_context.Topics, "TopicID", "TopicName");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreatePodcast([Bind("PodcastID,Title,Description,ImageUrl,ReleaseDate,EpNum,UserID,TopicID")] Podcast podcast)
        {
            podcast.UserID = User?.FindFirstValue(ClaimTypes.NameIdentifier);
            podcast.ReleaseDate = DateTime.Now;
            podcast.EpNum = 0;
            if (ModelState.IsValid)
            {
                _context.Add(podcast);
                await _context.SaveChangesAsync();
                return RedirectToAction("CreatePodcast","User");
            }
            ViewData["EpisodeID"] = new SelectList(_context.Podcasts, "PodcastID", "Title", podcast.PodcastID);
            return View(podcast);
        }
		public IActionResult CreateEpisode()
		{
			var userID = User?.FindFirstValue(ClaimTypes.NameIdentifier);
			var podcastList = _context.Podcasts.Where(p => p.UserID == userID).ToList();
			ViewData["Podcasts"] = new SelectList(podcastList, "PodcastID", "Title");
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> CreateEpisode([Bind("EpisodeId,Title,Description,AudioUrl,ReleaseDate,Duraion,EpImage,PodcastID")] Episode episode)
		{
			episode.Duraion = 0;
			episode.ReleaseDate = DateTime.Now;
			if (ModelState.IsValid)
			{
				_context.Add(episode);
				await _context.SaveChangesAsync();
				return RedirectToAction("CreateEpisode", "User");
			}
			ViewData["Episodes"] = new SelectList(_context.Episodes, "EpisodeID", "Title", episode.PodcastID);
			return View(episode);
		}

        [HttpPost]
        public IActionResult DeleteEpisode(int? episodeId)
        {
            if (_context.Episodes == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Episodes' is null.");
            }

            var episode = _context.Episodes.FirstOrDefault(e => e.EpisodeId == episodeId);
            int id = episode.PodcastID;
            if (episode != null)
            {
                _context.Episodes.Remove(episode);
                _context.SaveChanges();
                _logger.LogInformation($"Episode {episodeId} đã được xoá thành công.");
                return RedirectToAction("MyEpisodesByPodcast", "User", new { id = id });
				// Điều hướng sau khi xoá thành công
			}
			_logger.LogWarning($"Episode {episodeId} không tìm thấy.");
            return NotFound(); // Xử lý nếu không tìm thấy episode
        }

		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> DeletePodcast(int? podcastId)
		{
			try
			{
				if (_context.Podcasts == null || _context.Episodes == null)
				{
					_logger.LogError("Entity set 'ApplicationDbContext.Podcasts' or 'ApplicationDbContext.Episodes' is null.");
					return Problem("Entity set 'ApplicationDbContext.Podcasts' or 'ApplicationDbContext.Episodes' is null.");
				}

				// Tìm podcast
				var podcast = await _context.Podcasts.FindAsync(podcastId);
				if (podcast == null)
				{
					_logger.LogWarning($"Podcast with ID {podcastId} not found.");
					return NotFound();
				}

				// Tìm tất cả các episode của podcast đó
				var episodes = _context.Episodes.Where(e => e.PodcastID == podcastId).ToList();
				if (episodes.Count > 0)
				{
					_context.Episodes.RemoveRange(episodes);
				}

				// Xóa podcast
				_context.Podcasts.Remove(podcast);
				await _context.SaveChangesAsync();

				_logger.LogInformation($"Podcast {podcastId} and its episodes have been deleted successfully.");
				return RedirectToAction("MyPodcast", "User"); // Điều hướng sau khi xoá thành công
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "An error occurred while deleting the podcast.");
				return StatusCode(500, "Internal server error");
			}
		}


		[HttpPost]
        public JsonResult CreatePlaylist(string playlistName) // Thay đổi tham số nhận vào
        {
            // Lấy UserID từ thông tin đăng nhập
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            // Kiểm tra xem tên playlist đã tồn tại hay chưa
            if (_context.Playlists.Any(p => p.PlaylistName == playlistName && p.UserId == userId))
            {
                return Json(new { success = false, message = "Playlist đã tồn tại!" });
            }
            // Tạo playlist mới
            var newPlaylist = new Playlist
            {
                PlaylistName = playlistName,
                UserId = userId
            };

            _context.Playlists.Add(newPlaylist);
            _context.SaveChanges();

            return Json(new { success = true, id = newPlaylist.PlaylistID, message = "Tạo playlist thành công" });
        }
        // GET: User/GetPlaylists
        [HttpGet]
        public JsonResult GetPlaylists()
        {
            // Lấy UserID từ thông tin đăng nhập
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            // Lấy danh sách playlist của người dùng
            var playlists = _context.Playlists
                .Where(p => p.UserId == userId)
                .Select(p => new { id = p.PlaylistID, name = p.PlaylistName })
                .ToList();

            // Trả về danh sách playlist dưới dạng JSON
            return Json(playlists);
        }
        [HttpGet]
        public async Task<IActionResult> MyPodcast()
        {

            //List<Podcast> podcasts;
            var userID = User?.FindFirstValue(ClaimTypes.NameIdentifier);
            
            if (userID == null || _context.Podcasts == null)
            {
                return NotFound();
            }
            var podcastList = _context.Podcasts.Where(p => p.UserID == userID).ToList();
            if (podcastList == null)
            {
                return NotFound();
            }
            var viewModel = new PodcastViewModel
            {
                Podcasts = podcastList
            };
            return View(viewModel);
        }
        public IActionResult MyEpisodesByPodcast(int? id)
        {
            // Lấy danh sách các episode thuộc podcast có PodcastID là podcastId
            List<Episode> episodes = _context.Episodes.Where(e => e.PodcastID == id).ToList();

            var podcasts = _context.Podcasts.FirstOrDefault(e => e.PodcastID == id);
            float totalRating = 0;
            float totalRatingsCount = 0;
            foreach (var episode in episodes)
            {
                var episodeRatings = _context.Ratings.Where(r => r.EpisodeID == episode.EpisodeId).ToList();
                foreach (var rating in episodeRatings)
                {
                    totalRating += rating.RatingValue;
                    totalRatingsCount++;
                }
            }

            float averageRating = totalRatingsCount > 0 ? totalRating / totalRatingsCount : 0;
            // Trả về view hiển thị danh sách các episode
            var viewModel = new ViewModelEpisodeByPodcast
            {
                Eps = episodes,
                PodcastID = podcasts.PodcastID,
                Title = podcasts.Title,
                ImageUrl = podcasts.ImageUrl,
                Description = podcasts.Description,
                ratingValue = averageRating,
                totalRating = totalRatingsCount
            };
            return View(viewModel);
        }
        public IActionResult MyPlaylist()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var playlists = _context.Playlists
                .Where(p => p.UserId == userId)
                .Select(p => new PlaylistViewModel
                {
                    PlaylistId = p.PlaylistID,
                    PlaylistName = p.PlaylistName
                })
                .ToList();
            return View(playlists);
        }
    }
}
