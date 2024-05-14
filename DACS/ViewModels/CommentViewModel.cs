using DACS.Models;

namespace DACS.ViewModels
{
    public class CommentViewModel
    {
        public Comment Comment{ get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string? UserProfileImageUrl { get; set; }
    }
}
