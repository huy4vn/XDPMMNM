using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XDPMMNM_sach.Models
{
    public class PNvaCTPNmodel
    {
        public Phieunhap phieunhap { get; set; }
        public CTPN ctpn { get; set; }
        public PNvaCTPNmodel()
        {
            this.phieunhap = new Phieunhap();
            this.ctpn = new CTPN();
        }
    }
}