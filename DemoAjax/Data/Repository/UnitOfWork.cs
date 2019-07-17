using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoAjax.Data.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        IEmployeeRepository employees { get; }

        int Complete();
    }

    public class UnitOfWork : IUnitOfWork
    {
        private readonly DemoTableContext _context;

        public UnitOfWork(DemoTableContext context)
        {
            _context = context;
            employees = new EmployeeRepository(_context);
        }

        public IEmployeeRepository employees { get; }

        public int Complete()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
