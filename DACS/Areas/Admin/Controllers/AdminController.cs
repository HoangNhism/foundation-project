using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Shared;
using SQLitePCL;

namespace DACS.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = Roles.Role_Admin)]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;
        public AdminController(IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo, UserManager<ApplicationUser> userManager)
        {
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
		public IActionResult CreateTopic()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateTopic([Bind("TopicName,Description,ImageURL")] Topic topic)
        {
            if (ModelState.IsValid)
            {
                _context.Add(topic);
                await _context.SaveChangesAsync();
                return RedirectToAction("CreateTopic", "Admin");
            }
            ViewData["TopicID"] = new SelectList(_context.Topics, "TopicID", "TopicName", topic.TopicID);
            return View(topic);
        }

        public async Task<IActionResult> Users()
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var users = await _context.Users.Where(u => u.Id != currentUser.Id).ToListAsync();
            return View(users);
        }

        public async Task<IActionResult> LockUser(string userId)
        {
            if (userId == null)
            {
                return NotFound();
            }
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
            if (user == null)
            {
                return NotFound();
            }
            user.LockoutEnd = DateTime.Now.AddYears(1000);
            await _context.SaveChangesAsync();
            return RedirectToAction("Users", "Admin");
        }

        public async Task<IActionResult> UnlockUser(string userId)
        {
            if (userId == null)
            {
                return NotFound();
            }
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
            if (user == null)
            {
                return NotFound();
            }
            user.LockoutEnd = null;
            await _context.SaveChangesAsync();
            return RedirectToAction("Users", "Admin");
        }

        public async Task<IActionResult> UpToAdmin(string userId)
        {
            string roleName = "Admin";
            if (userId == null)
            {
                return NotFound();
            }
            var user = _context.Users.FirstOrDefault(u => u.Id == userId);
            if (user == null)
            {
                return NotFound();
            }
            var userRole = await _userManager.GetRolesAsync(user);
            if (userRole.Contains(roleName))
            {
                await _userManager.RemoveFromRolesAsync(user, await _userManager.GetRolesAsync(user));
                return RedirectToAction("Users", "Admin");
            }
            await _userManager.RemoveFromRolesAsync(user, await _userManager.GetRolesAsync(user));
            await _userManager.AddToRoleAsync(user, roleName);
            TempData["Message"] = "Đã cập nhật vai trò thành công";
            return RedirectToAction("Users", "Admin");
        }

        public IActionResult SetUserPassword(string userId)
        {
            SetUserPasswordViewModel viewModel = new SetUserPasswordViewModel
            {
                UserId = userId
            };
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetUserPassword(string userId, string password, string confirmPassword)
        {
            if (string.IsNullOrEmpty(userId))
            {
                return NotFound();
            }

            if (password != confirmPassword)
            {
                TempData["Error"] = "Passwords do not match.";
                return View();
            }

            var user = _context.Users.FirstOrDefault(u => u.Id == userId);
            if (user == null)
            {
                return NotFound();
            }
            await _userManager.RemovePasswordAsync(user);
            var result = await _userManager.AddPasswordAsync(user, password);
            if (result.Succeeded)
            {
                TempData["Message"] = "Your password has been set.";
                return RedirectToAction("Users", "Admin");
            }
            else
            {
                TempData["Error"] = "Failed to set the password.";
                return View();
            }
        }

        public async Task<IActionResult> EditTopic(int? id)
        {
            if (id == null || _context.Topics == null)
            {
                return NotFound();
            }

            var topic = await _context.Topics.FindAsync(id);
            if (topic == null)
            {
                return NotFound();
            }
            return View(topic);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditTopic(int id, [Bind("TopicID, TopicName, Description, ImageURL")] Topic topic)
        {
            if (id != topic.TopicID)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(topic);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TopicExists(topic.TopicID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(topic);
        }
        private bool TopicExists(int id)
        {
            return (_context.Topics?.Any(e => e.TopicID == id)).GetValueOrDefault();
        }
        public async Task<IActionResult> IndexTopic()
        {
            var applicationDbContext = _context.Topics.ToListAsync();
            return View(await applicationDbContext);
        }
    }
}
