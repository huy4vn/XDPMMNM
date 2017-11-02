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
    public class DailisController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Dailis
        public ActionResult Index()
        {
            return View(db.Dailis.ToList());
        }

        // GET: Dailis/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Daili daili = db.Dailis.Find(id);
            if (daili == null)
            {
                return HttpNotFound();
            }
            return View(daili);
        }

        // GET: Dailis/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dailis/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdDL,TenDL,DiaChi,SDT")] Daili daili)
        {
            if (ModelState.IsValid)
            {
                db.Dailis.Add(daili);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(daili);
        }

        // GET: Dailis/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Daili daili = db.Dailis.Find(id);
            if (daili == null)
            {
                return HttpNotFound();
            }
            return View(daili);
        }

        // POST: Dailis/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdDL,TenDL,DiaChi,SDT")] Daili daili)
        {
            if (ModelState.IsValid)
            {
                db.Entry(daili).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(daili);
        }

        // GET: Dailis/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Daili daili = db.Dailis.Find(id);
            if (daili == null)
            {
                return HttpNotFound();
            }
            return View(daili);
        }

        // POST: Dailis/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Daili daili = db.Dailis.Find(id);
            db.Dailis.Remove(daili);
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
