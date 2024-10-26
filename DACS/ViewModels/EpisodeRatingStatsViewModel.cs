namespace DACS.ViewModels
{
    public class EpisodeRatingStatsViewModel
    {
        public int EpisodeId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int Duration { get; set; }
        public string EpImage { get; set; }
        public int TotalRatings { get; set; }
        public float AverageRating { get; set; }
    }
}
