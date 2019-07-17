using DemoAjax.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoAjax.Data.Repository
{
    public interface IEmployeeRepository : IRepository<Employee>
    {
        IEnumerable<Employee> GetEmployeeByName(string name);
    }

    public class EmployeeRepository : Repository<Employee>, IEmployeeRepository
    {
        private readonly DemoTableContext _context;

        public EmployeeRepository(DemoTableContext context) : base(context)
        {
            _context = context;
        }

        public IEnumerable<Employee> GetEmployeeByName(string name)
        {
            return _context.Employee.Where(x => x.Name == name);
        }
    }
}
