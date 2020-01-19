using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Musikas.Models;

namespace Musikas.Controllers
{
    public class MusikasController : Controller
    {
        private MusikasEntities db = new MusikasEntities();

        // GET: Musikas
        public ActionResult Index()
        {
            return View(db.Musikas.ToList().OrderBy(m => m.ReleaseDate));
        }

        // POST: Musikas (Filter by Title)
        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            string title = form["txtTitle"];

            return View(db.Musikas.Where(t => t.Title.Contains(title)).OrderBy(m => m.ReleaseDate));
        }

        // GET: Musikas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Musika musika = db.Musikas.Find(id);
            if (musika == null)
            {
                return HttpNotFound();
            }
            return View(musika);
        }

        // GET: Musikas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Musikas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,ReleaseDate,Director")] Musika musika)
        {

            // Validate the Id
            if (!PkValidate(musika))
                ModelState.AddModelError("Id", "There is another musika with the same id");

            // Validate the musika
            if (!MusikaValidate(musika))            
                ModelState.AddModelError("Title", "There is another musika with the same title and director");            

            if (ModelState.IsValid)
            {
                db.Musikas.Add(musika);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(musika);
        }

        // GET: Musikas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Musika musika = db.Musikas.Find(id);
            if (musika == null)
            {
                return HttpNotFound();
            }
            return View(musika);
        }

        // POST: Musikas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,ReleaseDate,Director")] Musika musika)
        {
            // Validate the musika
            if (!MusikaValidate(musika))
            {
                ModelState.AddModelError("Title", "There is another musika with the same title and director");
            }

            if (ModelState.IsValid)
            {              
                db.Entry(musika).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(musika);
        }

        // GET: Musikas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Musika musika = db.Musikas.Find(id);
            if (musika == null)
            {
                return HttpNotFound();
            }
            return View(musika);
        }

        // POST: Musikas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Musika musika = db.Musikas.Find(id);
            db.Musikas.Remove(musika);
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
        
        // Function to validate title and director of the musika
        private bool MusikaValidate(Musika musika)
        {
            // Count musikas with the same title and director and different Id
            int musikas = db.Musikas.Where(t => t.Title.ToLower() == musika.Title.ToLower())
                                  .Where(d => d.Director.ToLower() == musika.Director.ToLower())
                                  .Where(i => i.Id != musika.Id)
                                  .Count();
            // Return true if there is no duplicate musika
            return musikas == 0;
        }

        // Function to validate PK
        private bool PkValidate(Musika musika)
        {
            // Count musikas with the same Id
            int musikas = db.Musikas.Where(i => i.Id == musika.Id)
                                  .Count();
            // Return true if there is no duplicate Id
            return musikas == 0;
        }
    }
}
