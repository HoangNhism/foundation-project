using Microsoft.EntityFrameworkCore;

namespace DACS.Models
{
    public class EFEpisodeRepo : IEpisodeRepo
    {
        private readonly ApplicationDbContext _context;
        public EFEpisodeRepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Episode>> GetAllAsync()
        {
            return await _context.Episodes.ToListAsync();
        }
        public async Task<Episode> GetByIdAsync(int id)
        {
            return await _context.Episodes.FindAsync(id);
        }
        public async Task AddAsync(Episode Episode)
        {
            _context.Episodes.Add(Episode);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(Episode Episode)
        {
            _context.Episodes.Update(Episode);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var Episode = await _context.Episodes.FindAsync(id);
            _context.Episodes.Remove(Episode);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Episode>> SearchAsync(string searchTerm)
        {
            var normalizedSearchTerm = searchTerm.ToLowerInvariant();
            var Episodes = await _context.Episodes
                .Where(p => p.Title.ToLower().Contains(normalizedSearchTerm))
                .ToListAsync();

            return Episodes;
        }
    }
}
