using System.ComponentModel.DataAnnotations;

namespace DACS.Models
{
    public class Subscription
    {
        public int SubscriptionID { get; set; }
        public DateTime SubscriptionDate { get; set; }
        public string UserID { get; set; }
        public ApplicationUser? User { get; set; }
        public int PodcastID { get; set; }
        public Podcast? Podcast { get; set; }
    }
}
