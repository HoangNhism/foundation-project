using Microsoft.EntityFrameworkCore;
using DACS.Models;

namespace DACS.Models
{
    public class EFPodcastRepo : IPodcastRepo
    {
        private readonly ApplicationDbContext _context;
        public EFPodcastRepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Podcast>> GetAllAsync()
        {
            return await _context.Podcasts.ToListAsync();
        }
        public async Task<Podcast> GetByIdAsync(int id)
        {
            return await _context.Podcasts.FindAsync(id);
        }
        public async Task AddAsync(Podcast Podcast)
        {
            _context.Podcasts.Add(Podcast);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(Podcast Podcast)
        {
            _context.Podcasts.Update(Podcast);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var Podcast = await _context.Podcasts.FindAsync(id);
            _context.Podcasts.Remove(Podcast);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Podcast>> SearchAsync(string searchTerm)
        {
            var normalizedSearchTerm = searchTerm.ToLowerInvariant();
            var podcasts = await _context.Podcasts
                .Where(p => p.Title.ToLower().Contains(normalizedSearchTerm))
                .ToListAsync();

            return podcasts;
        }
    }
}
