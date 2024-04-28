using DACS.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DACS.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;

        public HomeController(ILogger<HomeController> logger, IPodcastRepo podcastRepo, ApplicationDbContext context)
        {
            _logger = logger;
            _podcastRepo = podcastRepo;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            List<Podcast> podcasts;
            podcasts = (await _podcastRepo.GetAllAsync()).ToList();
            podcasts = podcasts.OrderBy(p => p.Title).ToList();
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
