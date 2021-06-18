using System;
using System.Collections.Generic;

namespace DemoAjax.Data
{
    public partial class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal? Salary { get; set; }
        public DateTime? CreatedDate { get; set; }
        public bool Status { get; set; }
    }
}
