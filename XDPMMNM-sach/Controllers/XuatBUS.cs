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
        public void AddKhoDL(KhoDL kho)
        {
            var a = (from c in db.KhoDLs
                     where c.IdDL == kho.IdDL && c.IdSach == kho.IdSach
                     select c
                   ).FirstOrDefault();
            if (a != null)
            {
                a.SL += kho.SL;
                db.Entry(a).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                db.KhoDLs.Add(kho);
                db.SaveChanges();
            }
        }
        public bool KTSL(CTPX[] ctpx)
        {          
            foreach (var i in ctpx)
            {
                var a = (from c in db.Khoes where c.IdSach == i.IdSach select c).DefaultIfEmpty().ToList();
                if (a[a.Count - 1] == null) return false;
                if (a[a.Count-1].SL - i.SoLuong < 0) return false;
            }
            return true;
        }
        public void CapnhatSLtrongKho(DateTime ngayghi, int sl, int idsach)
        {
            var query = (from c in db.Khoes where c.IdSach == idsach select c).DefaultIfEmpty().ToList();
            var a = query[query.Count - 1];

            
            if (a.NgayGhi.Date == ngayghi.Date)              
            {
                a.SL -= sl;
                db.Entry(a).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                Kho k = new Kho();
                k.IdSach = idsach;
                k.SL = a.SL-sl;
                k.NgayGhi = ngayghi.Date;
                db.Khoes.Add(k);
            }
            db.SaveChanges();

        }
        public void Congno(Phieuxuat px)
        {
            int tongtien = 0;int tongsl = 0;
            foreach (var i in px.CTPXes)
            {
                var gia = (from c in db.Saches where c.IdSach == i.IdSach select c.GiaXuat).FirstOrDefault();
                tongtien += gia*i.SoLuong;
                tongsl += i.SoLuong;
            }

            var query = (from c in db.Congnoes where c.IdDL == px.IdDL select c).DefaultIfEmpty().ToList();
            var a = query[query.Count - 1];
            if (a.Ngay.Date == px.NgayXuat.Date)//cùng ngay thi update lại
            {

                a.SLsachlay += tongsl;
                a.Tongtienno += tongtien;
                db.Entry(query).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

            }
            else
            if (a==null || a.Ngay.Date!=px.NgayXuat.Date)
            {
                Congno cn = new Congno();
                cn.Ngay = px.NgayXuat.Date;
                cn.IdDL = px.IdDL;
                cn.SLsachlay = tongsl;
                cn.Tongtienno = tongtien;
                cn.Tongtiendatra = 0;
                db.Congnoes.Add(cn);
                db.SaveChanges();

            }
            
            
        }
    }
}