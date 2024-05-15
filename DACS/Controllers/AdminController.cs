using DACS.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace DACS.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPodcastRepo _podcastRepo;
        private readonly IEpisodeRepo _episodeRepo;
        private readonly ITopicRepo _topicRepo;
        public AdminController(IPodcastRepo podcastRepo, ApplicationDbContext context, IEpisodeRepo episodeRepo, ITopicRepo topicRepo)
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
                return RedirectToAction("CreateTopic","Admin");
            }
            ViewData["TopicID"] = new SelectList(_context.Topics, "TopicID", "TopicName", topic.TopicID);
            return View(topic);
        }
    }
}
