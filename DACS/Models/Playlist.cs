namespace DACS.Models
{
    public class Playlist
    {
        public int PlaylistID { get; set; }
        public string PlaylistName { get; set;}
        public string UserId { get; set; }
        public ApplicationUser? User { get; set; }
        public List<Episode> Episodes { get; set; }
        public List<PlaylistDetail> PlaylistDetails { get; set; }

    }
}
