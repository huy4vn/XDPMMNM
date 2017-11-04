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
                if (ctpx == null)
                {
                    ModelState.AddModelError("", "Chưa thêm chi tiết phiếu nhập");
                    ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL");
                    ViewBag.idsach = new SelectList(db.Saches, "IdSach", "TenSach");
                    return View();
                }
                if (!new XuatBUS().KTSL(ctpx))
                {
                    ModelState.AddModelError("", "Không đủ số lượng hoặc có sách chưa nhập về");
                    ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL");
                    ViewBag.idsach = new SelectList(db.Saches, "IdSach", "TenSach");
                    PXvaCTPXmodel view1 = new PXvaCTPXmodel();
                    phieuxuat.CTPXes = ctpx;
                    view1.phieuxuat =phieuxuat;
                    return View(view1);
                }
                else
                {
                    foreach (var i in ctpx)
                    {
                        //cap nhat sl sách trong kho
                        new XuatBUS().CapnhatSLtrongKho(phieuxuat.NgayXuat, i.SoLuong, i.IdSach);
                        //cap nhat kho dai li
                        KhoDL khodaily = new KhoDL();
                        khodaily.IdSach = i.IdSach;
                        khodaily.IdDL = phieuxuat.IdDL;
                        khodaily.SL = i.SoLuong;
                        new XuatBUS().AddKhoDL(khodaily);
                        phieuxuat.CTPXes.Add(i);
                    }

                    db.Phieuxuats.Add(phieuxuat);
                    new XuatBUS().Congno(phieuxuat);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
           
            ViewBag.IdDL = new SelectList(db.Dailis, "IdDL", "TenDL");
            ViewBag.idsach = new SelectList(db.Saches, "IdSach", "TenSach");
            PXvaCTPXmodel view2 = new PXvaCTPXmodel();
            phieuxuat.CTPXes = ctpx;
            view2.phieuxuat = phieuxuat;
            return View(view2);
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
