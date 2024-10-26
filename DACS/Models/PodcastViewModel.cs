namespace DACS.Models
{
    public class PodcastViewModel
    {
        public List<Podcast> Podcasts { get; set; }
        public List<Episode>? Episodes { get; set; }
        public List<Topic> Topics { get; set; }

    }
}
