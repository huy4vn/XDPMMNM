//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace XDPMMNM_sach.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Phieuxuat
    {
        public Phieuxuat()
        {
            this.CTPXes = new HashSet<CTPX>();
        }
    
        public int IdPx { get; set; }
        public string NgayXuat { get; set; }
        public string NguoiNhan { get; set; }
        public int IdDL { get; set; }
    
        public virtual ICollection<CTPX> CTPXes { get; set; }
        public virtual Daili Daili { get; set; }
    }
}
