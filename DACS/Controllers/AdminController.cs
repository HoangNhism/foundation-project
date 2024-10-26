using DACS.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

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
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Topics.ToListAsync();
            return View(await applicationDbContext);
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
        public async Task<IActionResult> Edit(int? id)
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
        public async Task<IActionResult> Edit(int id, [Bind("TopicID, TopicName, Description, ImageURL")] Topic topic)
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
    }
}
