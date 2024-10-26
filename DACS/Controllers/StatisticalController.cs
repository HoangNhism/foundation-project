using DACS.Models;
using DACS.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace DACS.Controllers
{
    public class StatisticalController : Controller
    {
        private readonly ApplicationDbContext _context;

        public StatisticalController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult EpisodeStats()
        {
            var stats = _context.Episodes
                .Select(e => new EpisodeRatingStatsViewModel
                {
                    EpisodeId = e.EpisodeId,
                    Title = e.Title,
                    Description = e.Description,
                    ReleaseDate = e.ReleaseDate,
                    Duration = e.Duraion,
                    EpImage = e.EpImage,
                    TotalRatings = _context.Ratings.Count(r => r.EpisodeID == e.EpisodeId),
                    AverageRating = (float)Math.Round(
                        _context.Ratings.Where(r => r.EpisodeID == e.EpisodeId)
                            .Average(r => (float?)r.RatingValue) ?? 0f, 1)
                })
                .OrderByDescending(e => e.AverageRating)
                .ThenByDescending(e => e.TotalRatings)
                .ToList();
            return View(stats);
        }
    }
}
