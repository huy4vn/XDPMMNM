using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XDPMMNM_sach.Models
{
    public class ThongKeKhoViewModel
    {
        public DateTime ngaybatdau { get; set; }
        public DateTime ngayketthuc { get; set; }
        public List<Kho> khos { get; set; }
        public ThongKeKhoViewModel()
        {
            ngaybatdau = DateTime.Now;
            ngayketthuc = DateTime.Now;
            this.khos=new List<Kho>();
        }
    }
}