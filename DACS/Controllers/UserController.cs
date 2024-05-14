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
    }
}
