using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DemoAjax.Models;
using Microsoft.AspNetCore.Hosting.Internal;

namespace DemoAjax.Controllers
{
    public class HomeController : Controller
    {
        private readonly HostingEnvironment _hostingEnvironment;

        public HomeController(HostingEnvironment hostingEnvironment )
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost, ActionName("Index")]
        public IActionResult IndexPost()
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
