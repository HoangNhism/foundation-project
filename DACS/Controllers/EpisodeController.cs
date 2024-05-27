using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing;
using System.Security.Claims;

namespace DACS.Controllers
{
    
    public class EpisodeController : Controller
    {
        private readonly ApplicationDbContext _context; // Thay YourDbContext bằng DbContext của bạn
        private readonly UserManager<ApplicationUser> _userManager;

        public EpisodeController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
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
        public IActionResult EpisodeByPlaylist(int playlistId)
        {
            var episodes = _context.PlaylistDetails
           .Where(pd => pd.PlaylistID == playlistId)
           .Include(pd => pd.Episode) // Include the related Episode
           .Select(pd => pd.Episode)
           .ToList();

            var playlist = _context.Playlists
                   .Include(p => p.PlaylistDetails) // Include PlaylistDetails
                   .ThenInclude(pd => pd.Episode) // Include Episode in PlaylistDetails
                   .FirstOrDefault(p => p.PlaylistID == playlistId);
            if (playlist == null)
            {
                return NotFound();
            }
            var viewModel = new ViewModelEpisodeByPlaylist
            {
                PlaylistId = playlistId,
                PlaylistName = playlist.PlaylistName,
                Episodes = episodes
            };

            return View(viewModel);
        }
        [Authorize]
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

            return RedirectToAction("Detail", "Episode", new { episodeId });
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

            return RedirectToAction("Detail", "Episode", new { episodeId });
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

            return RedirectToAction("Detail", "Episode", new { episodeId = comment.EpisodeID });
        }
        [HttpPost]
        public JsonResult AddToPlaylist(int episodeId, int playlistId)
        {
            // Kiểm tra xem episode đã có trong playlist hay chưa
            if (_context.PlaylistDetails.Any(pd => pd.EpisodeId == episodeId && pd.PlaylistID == playlistId))
            {
                return Json(new { success = false, message = "Episode đã có trong playlist!" });
            }

            // Tạo liên kết giữa episode và playlist
            var playlistDetail = new PlaylistDetail
            {
                EpisodeId = episodeId,
                PlaylistID = playlistId
            };

            _context.PlaylistDetails.Add(playlistDetail);
            _context.SaveChanges();

            return Json(new { success = true, message = "Thêm episode vào playlist thành công!" });
        }

        public JsonResult RemoveFromPlaylist(int episodeId, int playlistId)
        {
            var episode = _context.PlaylistDetails.FirstOrDefault(pd => pd.PlaylistID == playlistId && pd.EpisodeId == episodeId);
            if(episode == null)
            {
				return Json(new { success = false, message = "Không tồn tại trong danh sách phát" });
			}
            _context.PlaylistDetails.Remove(episode);
            _context.SaveChanges();
			return Json(new { success = true, message = "Đã xoá khỏi danh sách phát!" });
		}
	}
}
