namespace DACS.Models
{
    public class Rating
    {
        public int RatingID { get; set; }
        public float RatingValue { get; set; }
        public string UserId { get; set; }
        public ApplicationUser? User { get; set; }
        public int PodcastID { get; set; }
        public Podcast? Podcast { get; set; }
    }
}
