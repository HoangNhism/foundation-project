namespace DACS.Models
{
    public class Comment
    {
        public int CommentID { get; set; }
        public string CommentText { get; set; }
        public DateTime CommentDate { get; set; }
        public int EpisodeID { get; set; }
        public Episode? Episode { get; set; }
        public string UserId { get; set; }
        public ApplicationUser? User { get; set; }
    }
}
