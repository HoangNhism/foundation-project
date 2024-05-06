namespace DACS.Models
{
    public interface IPodcastRepo
    {
        Task<IEnumerable<Podcast>> GetAllAsync();
        Task<Podcast> GetByIdAsync(int id);
        Task AddAsync(Podcast podcast);
        Task UpdateAsync(Podcast podcast);
        Task DeleteAsync(int id);
        Task<IEnumerable<Podcast>> SearchAsync(string searchTerm);
    }
}
