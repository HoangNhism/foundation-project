using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace DACS.Models
{
    public class ApplicationUser : IdentityUser
    {
        [Required]
        public string FullName { get; set; }
        [Required]
        public DateTime Dob { get; set; }
    }
}
