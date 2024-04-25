namespace DACS.Models
{
    public class Podcast
    {
        public int PodcastID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int Duration { get; set;}
        public int ArtistID { get; set; }
        public Artist? Artist { get; set; }
        public int TopicID { get; set; }
        public Topic? Topic { get; set; }
    }
}
