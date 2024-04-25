namespace DACS.Models
{
    public class Subscription
    {
        public int SubcriptionID { get; set; }
        public DateTime SubcriptiontDate { get; set; }
        public string UserID { get; set; }
        public ApplicationUser? User { get; set; }
        public int PodcastID { get; set; }
        public Podcast? Podcast { get; set; }
    }
}
