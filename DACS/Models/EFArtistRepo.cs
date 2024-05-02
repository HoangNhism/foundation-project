using Microsoft.EntityFrameworkCore;

namespace DACS.Models
{
    public class EFArtistRepo : IArtistRepo
    {
        private readonly ApplicationDbContext _context;
        public EFArtistRepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Artist>> GetAllAsync()
        {
            return await _context.Artists.ToListAsync();
        }
        public async Task<Artist> GetByIdAsync(int id)
        {
            return await _context.Artists.FindAsync(id);
        }
        public async Task AddAsync(Artist Artist)
        {
            _context.Artists.Add(Artist);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(Artist Artist)
        {
            _context.Artists.Update(Artist);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var Artist = await _context.Artists.FindAsync(id);
            _context.Artists.Remove(Artist);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Artist>> SearchAsync(string searchTerm)
        {
            var normalizedSearchTerm = searchTerm.ToLowerInvariant();
            var Artists = await _context.Artists
                .Where(p => p.ArtistName.ToLower().Contains(normalizedSearchTerm))
                .ToListAsync();

            return Artists;
        }
    }
}
