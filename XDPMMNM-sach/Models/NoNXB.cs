//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace XDPMMNM_sach.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class NoNXB
    {
        public int IdNXB { get; set; }
        public System.DateTime NgayNhap { get; set; }
        public int TienNo { get; set; }
    
        public virtual NXB NXB { get; set; }
    }
}
