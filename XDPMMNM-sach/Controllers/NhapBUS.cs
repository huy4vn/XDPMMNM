using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XDPMMNM_sach.Models;

namespace XDPMMNM_sach.Controllers
{
    public class NhapBUS
    {
        private Model1Container db = new Model1Container();
        public bool addSach(Phieunhap phieunhap,CTPN[] ctpn)
        {
            try
            {//phieunhap.NgayNhap = DateTime.Today;
                NoNXB no = new NoNXB();
                Kho kho = new Kho();
                //tao dl ao
                no.NgayNhap = phieunhap.NgayNhap;
                no.IdNXB = phieunhap.IdNXB;
                kho.NgayGhi = phieunhap.NgayNhap;

                foreach (var i in ctpn) //code ctpn in here
                {
                    Sach sach = db.Saches.Find(i.IdSach);
                    kho.IdSach = sach.IdSach;
                    kho.SL = i.SoLuong;
                    no.TienNo = i.SoLuong * sach.GiaNhap;
                    UpdateNo(no);
                    UpdateKho(kho);
                    phieunhap.CTPNs.Add(i);
                    db.SaveChanges();

                }
                db.Phieunhaps.Add(phieunhap);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        private void UpdateKho(Kho ct)
        {
            if (db.Khoes.Any(c => c.NgayGhi == ct.NgayGhi))
            {
                UpdateKhoCungNgay(ct);
            }
            else
            {
                UpdateKhoKhacNgay(ct);
            }
        }
        private void UpdateKhoKhacNgay(Kho ct)
        {
            if (db.Khoes.Any(c => c.IdSach == ct.IdSach))
            {
                Kho kho = db.Khoes.OrderByDescending(c => c.IdSach == ct.IdSach).FirstOrDefault();
                ct.SL = kho.SL + ct.SL;
            }
            db.Khoes.Add(ct);
        }
        private void UpdateKhoCungNgay(Kho ct)
        {
            if (db.Khoes.Any(c => c.IdSach == ct.IdSach && c.NgayGhi == ct.NgayGhi))
            {
                Kho kho = db.Khoes.Where(c => c.IdSach == ct.IdSach && c.NgayGhi == ct.NgayGhi).FirstOrDefault();
                kho.SL = kho.SL + ct.SL;
            }
            else
            {
                db.Khoes.Add(ct);
            }
        }
        private void UpdateNo(NoNXB no)
        {
            if (db.NoNXBs.Any(o => o.IdNXB == no.IdNXB))
            {
                NoNXB olditem = db.NoNXBs.Where(c => c.IdNXB == no.IdNXB).FirstOrDefault();
                olditem.TienNo = olditem.TienNo + no.TienNo;
                db.Entry(olditem).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                db.NoNXBs.Add(no);
            }
        }
    }
}
}