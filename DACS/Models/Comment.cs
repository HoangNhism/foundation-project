namespace DACS.Models
{
    public class Comment
    {
        public int CommentID { get; set; }
        public string CommentText { get; set; }
        public DateTime CommentDate { get; set; }
        public int PodcastID { get; set; }
        public Podcast? Podcast { get; set; }
        public string UserId { get; set; }
        public ApplicationUser? User { get; set; }
    }
}
