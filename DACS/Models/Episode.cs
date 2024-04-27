namespace DACS.Models
{
    public class Episode
    {
        public int EpisodeId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string? ImageUrl { get; set;}
        public DateTime ReleaseDate { get; set; }
        public int Duraion { get; set; }
        public int PodcastID { get; set; }
        public Podcast? Podcast { get; set; }
    }
}
