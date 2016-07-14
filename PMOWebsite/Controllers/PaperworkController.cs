using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PMOWebsite.Controllers
{
    public class PaperworkController : Controller
    {
        // GET: Paperwork
        public ActionResult Documents()
        {
            return View();
        }

        // GET: Paperwork
        public ActionResult ComingSoon()
        {
            return View();
        }

        // GET: Download
        public ActionResult Download(string downloadID)
        {
            try
            {
            switch (downloadID)
            {
                case "Project Request Document (PID)":
                    string filename = "Student List.csv";
                    string filepath = Server.MapPath("~/CSV/Student List.csv");
                    byte[] filedata = System.IO.File.ReadAllBytes(filepath);
                    string contentType = MimeMapping.GetMimeMapping(filepath);
                    var cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Steering Committee":
                     filename = "Student List.csv";
                     filepath = Server.MapPath("~/CSV/Student List.csv");
                     filedata = System.IO.File.ReadAllBytes(filepath);
                     contentType = MimeMapping.GetMimeMapping(filepath);
                     cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Classification & Sizing":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Assign Project Manager/Lead":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Phase Sign-off/Closure Document":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Reqirements Management":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Vendor Specification":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Planning Documents":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Plan/Project Charter (Dynamic)":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Risk Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Time Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Cost Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Resource Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Issue Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Scope Management Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Planning Kick-Off Meeting":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Milestones List":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Phase Sign-off Document":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Kick -off Meeting":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Task List (Deliverables)":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Communication List":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Risk Log":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Schedule":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Manage Scope":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Manage Costs":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Issues List":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Status Report":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Visual Project Plan":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Approved Changes":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Perfomance measures":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Contract changes":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Document Issues":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Conduct Status Review meetings":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Corrective actions":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Change Request":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Meeting Minutes":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Meeting Agenda":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Lessons Learned":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Project Sign-off/Closure Document":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Formal Acceptance":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Transition to Production/Operations":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Contract Closure":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                case "Administrative Closure Documentation":
                    filename = "Student List.csv";
                    filepath = Server.MapPath("~/CSV/Student List.csv");
                    filedata = System.IO.File.ReadAllBytes(filepath);
                    contentType = MimeMapping.GetMimeMapping(filepath);
                    cd = new System.Net.Mime.ContentDisposition
                    {
                        FileName = filename,
                        Inline = true,
                    };

                    Response.AppendHeader("Content-Disposition", cd.ToString());

                    return File(filedata, contentType);
                default:
                     return RedirectToAction("Documents");
            }
            }
            catch (Exception e)
            {
                return RedirectToAction("ComingSoon");
            }
        }
    }
}