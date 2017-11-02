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
    public class PhieuxuatsController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Phieuxuats
        public ActionResult Index()
        {
            var phieuxuats = db.Phieuxuats.Include(p => p.Daili);
            return View(phieuxuats.ToList());
        }

        // GET: Phieuxuats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieuxuat phieuxuat = db.Phieuxuats.Find(id);
            if (phieuxuat == null)
            {
                return HttpNotFound();
            }
            return View(phieuxuat);
        }

        // GET: Phieuxuats/Create
        public ActionResult Create()
        {
            ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL");
            ViewBag.idsach= new SelectList(db.Saches, "IdSach", "TenSach");
            return View();
        }

        // POST: Phieuxuats/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdPx,NgayXuat,NguoiNhan,IdDL")] Phieuxuat phieuxuat,
                                    [Bind(Prefix = "ct")] CTPX[] ctpx)
        {
            if (ModelState.IsValid)
            {
                foreach (var i in ctpx)
                {
                    phieuxuat.CTPXes.Add(i);
                    KhoDL khodl = new KhoDL();
                }

                db.Phieuxuats.Add(phieuxuat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL", phieuxuat.IdDL);
            return View(phieuxuat);
        }

        // GET: Phieuxuats/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieuxuat phieuxuat = db.Phieuxuats.Find(id);
            if (phieuxuat == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL", phieuxuat.IdDL);
            return View(phieuxuat);
        }

        // POST: Phieuxuats/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdPx,NgayXuat,NguoiNhan,IdDL")] Phieuxuat phieuxuat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phieuxuat).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL", phieuxuat.IdDL);
            return View(phieuxuat);
        }

        // GET: Phieuxuats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phieuxuat phieuxuat = db.Phieuxuats.Find(id);
            if (phieuxuat == null)
            {
                return HttpNotFound();
            }
            return View(phieuxuat);
        }

        // POST: Phieuxuats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phieuxuat phieuxuat = db.Phieuxuats.Find(id);
            db.Phieuxuats.Remove(phieuxuat);
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
