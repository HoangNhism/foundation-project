using Microsoft.AspNetCore.Identity;

namespace DACS.Models
{
    public class Podcast
    {
        public int PodcastID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int EpNum { get; set;}
        public string? UserID { get; set; }
        public int TopicID { get; set; }
        public Topic? Topic { get; set; }
    }
}
