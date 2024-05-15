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
		private readonly EFPodcastRepo _podcastRepo;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<LoginModel> _logger;
        public PodcastController(ApplicationDbContext context, EFPodcastRepo podcastRepo, UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, ILogger<LoginModel> logger)
        {
            _context = context;
			_podcastRepo = podcastRepo;
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
				return Json(new { success = false, message = "User not logged in" });
			}

			var existingSubscription = await _context.Subscriptions.FirstOrDefaultAsync(p => p.PodcastID == PodcastID && p.UserID == userId);
			bool isSubscribed = false;

			if (existingSubscription != null)
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
				isSubscribed = true;
			}

			return Json(new { success = true, isSubscribed });
		}
		[HttpGet]
		public async Task<IActionResult> CheckSubscription(int podcastId)
		{
			var userId = User?.FindFirstValue(ClaimTypes.NameIdentifier);
			if (userId == null)
			{
				return Json(new { isSubscribed = false });
			}

			var isSubscribed = await _context.Subscriptions.AnyAsync(s => s.PodcastID == podcastId && s.UserID == userId);
			return Json(new { isSubscribed });
		}
		public async Task<IActionResult> Search(string term)
		{
			var podcasts = await _podcastRepo.SearchAsync(term);
			var podcastNames = podcasts.Select(x => x.Title).ToList();
			var filteredPodcast = podcastNames.Where(p => p.ToLower().Contains(term.ToLower()));
			return Json(filteredPodcast);
		}

	}
}
