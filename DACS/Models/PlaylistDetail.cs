using System.ComponentModel.DataAnnotations.Schema;

namespace DACS.Models
{
    public class PlaylistDetail
    {
        public int PlayListDetailID { get; set; }
        public int PlaylistID { get; set;}
        public int EpisodeId { get; set; }
        public Playlist Playlist { get; set;}
        public Episode Episode { get; set;}
    }
}
