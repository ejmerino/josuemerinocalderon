using Microsoft.EntityFrameworkCore;
using Conjunta1.Models;

namespace Conjunta1.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        { }

        public DbSet<Empleado> Empleados { get; set; }
    }
}
