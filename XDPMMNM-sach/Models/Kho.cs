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
    
    public partial class Kho
    {
        public System.DateTime NgayGhi { get; set; }
        public int IdSach { get; set; }
        public int SL { get; set; }
    
        public virtual Sach Sach { get; set; }
    }
}
