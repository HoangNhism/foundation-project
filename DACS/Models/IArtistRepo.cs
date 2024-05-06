namespace DACS.Models
{
    public interface IArtistRepo
    {
        Task<IEnumerable<Artist>> GetAllAsync();
        Task<Artist> GetByIdAsync(int id);
        Task AddAsync(Artist artist);
        Task UpdateAsync(Artist artist);
        Task DeleteAsync(int id);
        Task<IEnumerable<Artist>> SearchAsync(string searchTerm);
    }
}
