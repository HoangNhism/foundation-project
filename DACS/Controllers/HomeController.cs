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
            List<Episode>? episodes;
            List<Topic> topics;
            podcasts = (await _podcastRepo.GetAllAsync()).ToList();
            podcasts = podcasts.OrderBy(p => p.Title).ToList();
            episodes = (await _episodeRepo.GetAllAsync()).ToList();
            episodes = episodes.OrderBy(p => p.Title).ToList();
            topics = (await _topicRepo.GetAllAsync()).ToList();
            topics = topics.OrderBy(p => p.TopicName).ToList();
            List<Episode>? topRatedEpisodes = _context.Ratings
                .GroupBy(r => r.EpisodeID) // Nhóm các đánh giá theo EpisodeId
                .Select(g => new
                {
                    EpisodeID = g.Key,
                    AverageRating = g.Average(r => r.RatingValue) // Tính trung bình rating cho mỗi tập podcast
                })
                .OrderByDescending(g => g.AverageRating) // Sắp xếp theo rating trung bình giảm dần
                .Take(5)
                .Select(g => _context.Episodes.FirstOrDefault(e => e.EpisodeId == g.EpisodeID)) // Lấy ra tập podcast tương ứng với mỗi nhóm
                .ToList();

            var viewModel = new PodcastViewModel
            {
                Podcasts = podcasts,
                Episodes = topRatedEpisodes,
                Topics = topics
            };
            return View(viewModel);
        }
        [HttpGet]
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
