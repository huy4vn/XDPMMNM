using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using XDPMMNM_sach.Models;

namespace XDPMMNM_sach.Controllers
{
    public class PhieunhapsController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Phieunhaps
        public ActionResult Index()
        {
            var phieunhaps = db.Phieunhaps.Include(p => p.NXB);
            return View(phieunhaps.ToList());
        }

        // GET: Phieunhaps/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieunhap phieunhap = db.Phieunhaps.Find(id);
            if (phieunhap == null)
            {
                return HttpNotFound();
            }
            return View(phieunhap);
        }

        // GET: Phieunhaps/Create
        public ActionResult Create()
        {
            List<NXB> nxb = db.NXBs.ToList();
            NXB a = new NXB();
            a.IdNXB = 0;
            a.TenNXB = "Vui lòng chọn NXB";
            nxb.Add(a);
            ViewBag.IdNXB = new SelectList(nxb,"IdNXB","TenNXB");
            ViewBag.idsach = new SelectList(db.Saches,"IdSach","TenSach");
            return View();
        }
        [HttpPost]
        public ActionResult fillSach(int nxbId)
        {
            List<Sach> objcity = new List<Sach>();
            objcity = db.Saches.Where(m => m.IdNXB == nxbId).ToList();
            SelectList obgcity = new SelectList(objcity, "IdSach", "TenSach", 0);
            return Json(obgcity);
        }
        // POST: Phieunhaps/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdPn,NgayNhap,NguoiGiao,IdNXB,NguoiNhan")] Phieunhap phieunhap
                                   , [Bind(Prefix = "ct")] CTPN[] ctpn)
        {
            if (ModelState.IsValid)
            {
                //phieunhap.NgayNhap = DateTime.Today;
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
                return RedirectToAction("Index");
            }

            ViewBag.IdNXB = new SelectList(db.NXBs, "IdNXB", "TenNXB", phieunhap.IdNXB);
            return View(phieunhap);
        }
        private void UpdateKho(Kho ct)
        {
            if (db.Khoes.Any(c => c.NgayGhi == ct.NgayGhi)){
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
            if (db.Khoes.Any(c => c.IdSach == ct.IdSach && c.NgayGhi==ct.NgayGhi))
            {
                Kho kho = db.Khoes.Where(c => c.IdSach == ct.IdSach && c.NgayGhi==ct.NgayGhi).FirstOrDefault();
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
                NoNXB olditem = db.NoNXBs.Where(c=>c.IdNXB==no.IdNXB).FirstOrDefault();
                olditem.TienNo = olditem.TienNo + no.TienNo;
                db.Entry(olditem).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                db.NoNXBs.Add(no);
            }
        }
        // GET: Phieunhaps/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieunhap phieunhap = db.Phieunhaps.Find(id);
            if (phieunhap == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdNXB = new SelectList(db.NXBs, "IdNXB", "TenNXB", phieunhap.IdNXB);
            return View(phieunhap);
        }

        // POST: Phieunhaps/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdPn,NgayNhap,NguoiGiao,IdNXB,NguoiNhan")] Phieunhap phieunhap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phieunhap).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdNXB = new SelectList(db.NXBs, "IdNXB", "TenNXB", phieunhap.IdNXB);
            return View(phieunhap);
        }

        // GET: Phieunhaps/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieunhap phieunhap = db.Phieunhaps.Find(id);
            if (phieunhap == null)
            {
                return HttpNotFound();
            }
            return View(phieunhap);
        }

        // POST: Phieunhaps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phieunhap phieunhap = db.Phieunhaps.Find(id);
            db.Phieunhaps.Remove(phieunhap);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
