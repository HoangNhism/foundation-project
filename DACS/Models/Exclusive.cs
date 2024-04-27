namespace DACS.Models
{
    public class Exclusive
    {
        public int ExclusiveID { get; set; }
        public string ExclusiveName { get; set;}
        public string ExclusiveDescription { get; set;}
        public decimal ExclusivePrice { get; set;}
        public int ValidityPeriod { get; set;}
        public string UserID { get; set;}
        public ApplicationUser? User { get; set;}
    }
}
