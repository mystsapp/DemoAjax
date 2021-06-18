using DemoAjax.Data;
using DemoAjax.Data.Repository;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoAjax.Controllers
{
    public class EmployeesController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;
        private readonly IUnitOfWork _unitOfWork;

        public EmployeesController(IEmployeeRepository employeeRepository, IUnitOfWork unitOfWork)
        {
            _employeeRepository = employeeRepository;
            _unitOfWork = unitOfWork;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ReportEmployee()
        {
            var employees = _unitOfWork.employees.GetAll();
            string listEmployees = JsonConvert.SerializeObject(employees);
            Report.Controllers.HomeController homeController = new Report.Controllers.HomeController();
            homeController.PrintReport();
            return View();
        }

        [HttpGet]
        public IActionResult LoadData(string name, string status, int page, int pageSize)
        {
            //var epployeeByName = _unitOfWork.employees.GetEmployeeByName("hongvt");

            int totalRow = 0;
            //var employees = _employeeRepository.GetAll();
            var employees = _unitOfWork.employees.GetAll();

            if (!string.IsNullOrEmpty(name))
            {
                employees = employees.Where(e => e.Name.Contains(name));
            }

            if (!string.IsNullOrEmpty(status))
            {
                employees = employees.Where(e => e.Status == bool.Parse(status));
            }

            totalRow = employees.Count();

            employees = employees.OrderByDescending(e => e.CreatedDate).Skip((page - 1) * pageSize).Take(pageSize);
            return Json(new
            {
                status = true,
                total = totalRow,
                data = employees
            });
        }

        [HttpPost]
        public IActionResult SaveData(string strEmployee)
        {

            Employee employee = JsonConvert.DeserializeObject<Employee>(strEmployee);

            bool status = false;
            string message = string.Empty;

            //add new employee if id = 0
            if (employee.Id == 0)
            {
                employee.CreatedDate = DateTime.Now;
                try
                {
                    _employeeRepository.Create(employee);
                    status = true;
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }
            }
            else
            {
                //update existing DB
                //save db
                try
                {
                    _employeeRepository.Update(employee);
                    status = true;
                }
                catch (Exception ex)
                {
                    status = false;
                    message = ex.Message;
                }

            }

            return Json(new
            {
                status = status,
                message = message
            });
        }

        [HttpGet]
        public IActionResult GetDetail(int id)
        {
            var employee = _employeeRepository.GetById(id);

            return Json(new
            {
                status = true,
                data = employee
            });
        }

        [HttpDelete]
        public IActionResult Delete(int id)
        {
            var employee = _employeeRepository.GetById(id);

            _employeeRepository.Delete(employee);

            return Json(new
            {
                status = true
            });
        }
    }
}
