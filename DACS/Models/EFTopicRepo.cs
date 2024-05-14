using Microsoft.EntityFrameworkCore;

namespace DACS.Models
{
    public class EFTopicRepo : ITopicRepo
    {
        private readonly ApplicationDbContext _context;
        public EFTopicRepo(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Topic>> GetAllAsync()
        {
            return await _context.Topics.ToListAsync();
        }
        public async Task<Topic> GetByIdAsync(int id)
        {
            return await _context.Topics.FindAsync(id);
        }
        public async Task AddAsync(Topic Topic)
        {
            _context.Topics.Add(Topic);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(Topic Topic)
        {
            _context.Topics.Update(Topic);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var Topic = await _context.Topics.FindAsync(id);
            _context.Topics.Remove(Topic);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Topic>> SearchAsync(string searchTerm)
        {
            var normalizedSearchTerm = searchTerm.ToLowerInvariant();
            var Topics = await _context.Topics
                .Where(p => p.TopicName.ToLower().Contains(normalizedSearchTerm))
                .ToListAsync();

            return Topics;
        }
    }
}
