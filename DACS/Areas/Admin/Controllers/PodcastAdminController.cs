using DACS.Controllers;
using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace DACS.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = Roles.Role_Admin)]
    public class PodcastAdminController : Controller
    {
        private readonly ILogger<PodcastAdminController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;
		private readonly UserManager<ApplicationUser> _userManager;

		public PodcastAdminController(ILogger<PodcastAdminController> logger, IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo, UserManager<ApplicationUser> userManager)
		{
			_logger = logger;
			_podcastRepo = podcastRepo;
			_context = context;
			_episodeRepo = episodeRepo;
			_topicRepo = topicRepo;
			_userManager = userManager;
		}
		public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> PodcastList()
        {
            List<Podcast> podcasts;
            if (_context.Podcasts == null)
            {
                return NotFound();
            }
            podcasts = await _context.Podcasts.ToListAsync();
            if (podcasts == null)
            {
                return NotFound();
            }
            var viewModel = new PodcastViewModel
            {
                Podcasts = podcasts
            };
            return View(viewModel);
        }
        public IActionResult EpisodesByPodcast(int? id)
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
				return RedirectToAction("EpisodesByPodcast", "PodcastAdmin", new { id = id });
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
				return RedirectToAction("PodcastList", "PodcastAdmin"); // Điều hướng sau khi xoá thành công
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "An error occurred while deleting the podcast.");
				return StatusCode(500, "Internal server error");
			}
		}
		public async Task<IActionResult> Detail(int? episodeID)
		{
			// Lấy ra chi tiết episode dựa trên episodeID
			var episode = _context.Episodes.FirstOrDefault(e => e.EpisodeId == episodeID);

			// Kiểm tra nếu không tìm thấy episode
			if (episode == null)
			{
				return NotFound(); // Hoặc thực hiện xử lý phù hợp với trường hợp này
			}

			// Lấy danh sách các comment liên kết với episodeID
			var comments = _context.Comments.Where(c => c.EpisodeID == episodeID).ToList();

			// Tạo ViewModelComment để truyền vào view
			var viewModel = new ViewModelComment
			{
				episodes = episode, // EpisodeID của episode
				Comments = new List<CommentViewModel>()
			};

			// Lặp qua từng bình luận và lấy thông tin người dùng từ UserManager
			foreach (var comment in comments)
			{
				var user = await _userManager.FindByIdAsync(comment.UserId);
				if (user != null)
				{
					var commentViewModel = new CommentViewModel
					{
						Comment = comment,
						UserId = user.Id,
						UserName = user.FullName,
						UserProfileImageUrl = "~/images/img_4.jpg" //user.ProfileImageUrl // (nếu có)
					};
					viewModel.Comments.Add(commentViewModel);
				}
			}

			// Trả về view hiển thị chi tiết episode và danh sách bình luận
			return View(viewModel);
		}
		[HttpPost]
		public async Task<IActionResult> RateEpisode(int episodeId, float ratingValue)
		{
			// Lấy UserId của người dùng hiện tại (nếu có)
			var userId = User?.FindFirstValue(ClaimTypes.NameIdentifier);
			// Kiểm tra nếu tập podcast tồn tại
			var episode = await _context.Episodes.FindAsync(episodeId);
			if (episode == null)
			{
				return NotFound();
			}

			// Tạo một đối tượng Rating mới
			var existingRating = await _context.Ratings.FirstOrDefaultAsync(r => r.EpisodeID == episode.EpisodeId && r.UserId == userId);

			if (existingRating != null)
			{
				// Nếu đã đánh giá, cập nhật giá trị đánh giá
				existingRating.RatingValue = ratingValue;
			}
			else
			{
				// Nếu chưa đánh giá, tạo một đánh giá mới
				var newRating = new Rating
				{
					EpisodeID = episodeId,
					UserId = userId,
					RatingValue = ratingValue
				};

				_context.Ratings.Add(newRating);
			}

			await _context.SaveChangesAsync();

			return RedirectToAction("Detail", "PodcastAdmin", new { episodeId });
		}

		// Action để xử lý việc thêm bình luận vào tập podcast
		[HttpPost]
		public async Task<IActionResult> AddComment(int episodeId, string commentText)
		{
			// Kiểm tra nếu tập podcast tồn tại
			var episode = await _context.Episodes.FindAsync(episodeId);
			if (episode == null)
			{
				return NotFound();
			}

			// Lấy UserId của người dùng hiện tại (nếu có)
			var userId = User?.FindFirstValue(ClaimTypes.NameIdentifier);

			// Tạo một đối tượng Comment mới
			var comment = new Comment
			{
				CommentText = commentText,
				CommentDate = DateTime.Now,
				UserId = userId, // Gán UserId của người dùng hiện tại
				EpisodeID = episodeId
			};

			// Thêm bình luận vào database
			_context.Comments.Add(comment);
			await _context.SaveChangesAsync();

			return RedirectToAction("Detail", "PodcastAdmin", new { episodeId });
		}
		[HttpPost]
		public async Task<IActionResult> DeleteComment(int commentId)
		{
			var comment = await _context.Comments.FindAsync(commentId);
			if (comment == null)
			{
				return NotFound();
			}

			// Kiểm tra xem người dùng có quyền xoá bình luận hay không
			var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
			if (comment.UserId != userId)
			{
				return Forbid(); // Hoặc thực hiện xử lý phù hợp với trường hợp này
			}

			_context.Comments.Remove(comment);
			await _context.SaveChangesAsync();

			return RedirectToAction("Detail", "PodcastAdmin", new { episodeId = comment.EpisodeID });
		}
	}
}
