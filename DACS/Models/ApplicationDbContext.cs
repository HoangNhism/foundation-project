using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace DACS.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<Artist> Artists { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Episode> Episodes { get; set; }
        public DbSet<Exclusive> Exclusives { get; set; }
        //public DbSet<ExclusiveDetail> ExclusiveDetails { get; set; }
        public DbSet<Playlist> Playlists { get; set; }
        public DbSet<Podcast> Podcasts { get; set; }
        public DbSet<Rating> Ratings { get; set; }
        public DbSet<Subscription> Subscriptions { get; set; }
        public DbSet<Topic> Topics { get; set; }
    }
}
