using DACS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DACS.Controllers
{
    public class CommentController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public CommentController(ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // Action để tạo mới một bình luận
        [HttpPost]
        public async Task<IActionResult> Create(Comment comment)
        {
            if (ModelState.IsValid)
            {
                comment.CommentDate = DateTime.Now;

                // Lấy thông tin người dùng hiện tại
                var user = await _userManager.GetUserAsync(User);
                if (user != null)
                {
                    comment.UserId = user.Id;

                    _context.Add(comment);
                    await _context.SaveChangesAsync();

                    return RedirectToAction("Index", new { podcastId = comment.PodcastID });
                }
            }
            // Nếu ModelState không hợp lệ hoặc không tìm thấy người dùng, quay lại form tạo mới với dữ liệu đã nhập
            return View(comment);
        }

        // Action để hiển thị tất cả các bình luận cho một Podcast
        public IActionResult Index(int podcastId)
        {
            var comments = _context.Comments
                .Where(c => c.PodcastID == podcastId)
                .Include(c => c.User) // Include để lấy thông tin của User
                .ToList();
            return View(comments);
        }

        // Action để hiển thị form tạo mới bình luận
        public IActionResult Create(int podcastId)
        {
            var comment = new Comment { PodcastID = podcastId };
            return View(comment);
        }
    }
}
