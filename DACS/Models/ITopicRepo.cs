namespace DACS.Models
{
    public interface ITopicRepo
    {
        Task<IEnumerable<Topic>> GetAllAsync();
        Task<Topic> GetByIdAsync(int id);
        Task AddAsync(Topic topic);
        Task UpdateAsync(Topic topic);
        Task DeleteAsync(int id);
        Task<IEnumerable<Topic>> SearchAsync(string searchTerm);
    }
}
