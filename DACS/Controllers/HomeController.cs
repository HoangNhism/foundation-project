using DACS.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace DACS.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;

        public HomeController(ILogger<HomeController> logger, IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo)
        {
            _logger = logger;
            _podcastRepo = podcastRepo;
            _context = context;
            _episodeRepo = episodeRepo;
            _topicRepo = topicRepo;
        }

        public async Task<IActionResult> Index()
        {
            List<Podcast> podcasts;
            List<Episode> episodes;
            List<Topic> topics;
            podcasts = (await _podcastRepo.GetAllAsync()).ToList();
            podcasts = podcasts.OrderBy(p => p.Title).ToList();
            episodes = (await _episodeRepo.GetAllAsync()).ToList();
            episodes = episodes.OrderBy(p => p.Title).ToList();
            topics = (await _topicRepo.GetAllAsync()).ToList();
            topics = topics.OrderBy(p => p.TopicName).ToList();
            var viewModel = new PodcastViewModel
            {
                Podcasts = podcasts,
                Episodes = episodes,
                Topics = topics
            };
            return View(viewModel);
        }
        public async Task<IActionResult> PodcastList(int? id)
        {
            List<Podcast> podcasts;
            if (id == null || _context.Podcasts == null)
            {
                return NotFound();
            }
            podcasts = _context.Podcasts.Where(p => p.TopicID == id).ToList();
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
        public IActionResult CreatePodcast()
        {
            ViewData["PodcastID"] = new SelectList(_context.Podcasts, "PodcastID", "Podcast");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreatePodcast([Bind("PodcastID,Podcast")] Podcast podcast)
        {
            if (ModelState.IsValid)
            {
                _context.Add(podcast);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PodcastID"] = new SelectList(_context.Podcasts, "PodcastID", "Podcast", podcast.PodcastID);
            return View(podcast);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult About()
        {
            return View();
        }
        public IActionResult Contact()
        {
            return View();
        }
    }
}
