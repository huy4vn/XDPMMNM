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
        private NhapBUS bus = new NhapBUS();

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
                if (bus.addSach(phieunhap, ctpn)) {
                return RedirectToAction("Index");
                }                  
            }

            ViewBag.IdNXB = new SelectList(db.NXBs, "IdNXB", "TenNXB", phieunhap.IdNXB);
            return View(phieunhap);
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
