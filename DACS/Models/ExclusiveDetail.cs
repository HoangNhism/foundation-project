namespace DACS.Models
{
    public class ExclusiveDetail
    {
        public int ExclusiveDetailID {  get; set; }

        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int ExclusiveID { get; set; }
        public string UserID { get; set; }
        public Exclusive? Exclusive { get; set; }
        public ApplicationUser? User { get; set; }
    }
}
