using DACS.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Security.Claims;

namespace DACS.Controllers
{
    public class UserController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;
        public UserController(IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo)
        {
            _podcastRepo = podcastRepo;
            _context = context;
            _episodeRepo = episodeRepo;
            _topicRepo = topicRepo;
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
                return RedirectToAction(nameof(Index));
            }
            ViewData["EpisodeID"] = new SelectList(_context.Podcasts, "PodcastID", "Title", podcast.PodcastID);
            return View(podcast);
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
    }
}
