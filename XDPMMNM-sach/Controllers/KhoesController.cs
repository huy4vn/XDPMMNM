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
    public class KhoesController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Khoes
        public ActionResult Index()
        {
            return View();
        }

        // GET: Khoes/Details/5
        public ActionResult Details()
        {
            ThongKeKhoViewModel kho = new ThongKeKhoViewModel();
            return View(kho);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details([Bind(Include = "ngaybatdau,ngayketthuc")] ThongKeKhoViewModel kho)
        {
            List<Kho> list = new List<Kho>();
            if (ModelState.IsValid)
            {

                list = db.Khoes.Where(c => c.NgayGhi >= kho.ngaybatdau && c.NgayGhi <= kho.ngayketthuc).ToList();
            }
            kho.khos = list;
            return View(kho);
        }

        // GET: Khoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Khoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NgayGhi,IdSach,SL")] Kho kho)
        {
            if (ModelState.IsValid)
            {
                db.Khoes.Add(kho);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdSach = new SelectList(db.Saches, "IdSach", "TenSach", kho.IdSach);
            return View(kho);
        }

        // GET: Khoes/Edit/5
        public ActionResult Edit(DateTime id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kho kho = db.Khoes.Find(id);
            if (kho == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdSach = new SelectList(db.Saches, "IdSach", "TenSach", kho.IdSach);
            return View(kho);
        }

        // POST: Khoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NgayGhi,IdSach,SL")] Kho kho)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kho).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdSach = new SelectList(db.Saches, "IdSach", "TenSach", kho.IdSach);
            return View(kho);
        }
        
        // GET: Khoes/Delete/5
        public ActionResult Delete(DateTime id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kho kho = db.Khoes.Find(id);
            if (kho == null)
            {
                return HttpNotFound();
            }
            return View(kho);
        }

        // POST: Khoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(DateTime id)
        {
            Kho kho = db.Khoes.Find(id);
            db.Khoes.Remove(kho);
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
