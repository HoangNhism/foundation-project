using DACS.Models;

namespace DACS.ViewModels
{
    public class ViewModelEpisodeByPlaylist
    {
        public string PlaylistName { get; set;}
        public List<Episode> Episodes { get; set; }
    }
}
