using DACS.Areas.Identity.Pages.Account;
using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace DACS.Controllers
{
    public class PodcastController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<LoginModel> _logger;
        public PodcastController(ApplicationDbContext context, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, ILogger<LoginModel> logger)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
        }
        public IActionResult Index()
        {
            return View();
        } 
        [HttpPost]
        public async Task<IActionResult> Subscription(int PodcastID)
        {
            var userId = User?.FindFirstValue(ClaimTypes.NameIdentifier);
            if (userId == null)
            {
                // Người dùng chưa đăng nhập, bạn có thể thực hiện xử lý phù hợp ở đây
                // Ví dụ: chuyển hướng người dùng đến trang đăng nhập
                return RedirectToAction("Login", "Account");
            }
            var existingSubscription = await _context.Subscriptions.FirstOrDefaultAsync(p => p.PodcastID == PodcastID && p.UserID == userId);
            if(existingSubscription != null)
            {
                _context.Subscriptions.Remove(existingSubscription);
                await _context.SaveChangesAsync();
            }
            else
            {
                var subscription = new Subscription
                {
                    PodcastID = PodcastID,
                    UserID = userId,
                    SubscriptionDate = DateTime.UtcNow
                };
                _context.Subscriptions.Add(subscription);
                await _context.SaveChangesAsync();
            }

            return Json(new { success = true });
        }
        [HttpGet]
        public IActionResult CheckSubscription(int podcastId)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            // Kiểm tra xem người dùng đã đăng ký podcast này chưa
            var isSubscribed = _context.Subscriptions.Any(s => s.PodcastID == podcastId && s.UserID == userId);

            return Json(new { isSubscribed });
        }



    }
}
