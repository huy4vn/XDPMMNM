using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using XDPMMNM_sach.Models;

namespace XDPMMNM_sach.Controllers
{
    public class XuatBUS
    {
        private Model1Container db = new Model1Container();
        void AddKhoDL(KhoDL kho)
        {
            var a = (from c in db.KhoDLs
                     where c.IdDL == kho.IdDL && c.IdSach == kho.IdSach
                     select c
                   ).FirstOrDefault();
            if (a != null)
            {
                kho.SL += a.SL;
                db.Entry(kho).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                db.KhoDLs.Add(kho);
                db.SaveChanges();
            }
        }
       
    }
}