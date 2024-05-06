namespace DACS.Models
{
    public interface IEpisodeRepo
    {
        Task<IEnumerable<Episode>> GetAllAsync();
        Task<Episode> GetByIdAsync(int id);
        Task AddAsync(Episode episode);
        Task UpdateAsync(Episode episode);
        Task DeleteAsync(int id);
        Task<IEnumerable<Episode>> SearchAsync(string searchTerm);
    }
}
