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
    
    public partial class NXB
    {
        public NXB()
        {
            this.Saches = new HashSet<Sach>();
            this.Phieunhaps = new HashSet<Phieunhap>();
        }
    
        public int IdNXB { get; set; }
        public string TenNXB { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
    
        public virtual ICollection<Sach> Saches { get; set; }
        public virtual ICollection<Phieunhap> Phieunhaps { get; set; }
        public virtual NoNXB NoNXB { get; set; }
    }
}
