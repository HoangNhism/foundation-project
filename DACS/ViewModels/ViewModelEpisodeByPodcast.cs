using DACS.Models;

namespace DACS.ViewModels
{
    public class ViewModelEpisodeByPodcast
    {
        public int PodcastID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public List<Episode> Eps { get; set; }
        public float ratingValue { get; set; }
        public float totalRating { get; set; }

    }
}
