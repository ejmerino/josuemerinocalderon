using Microsoft.EntityFrameworkCore;
using Conjunta1.Data;
using Conjunta1.Controllers;

var builder = WebApplication.CreateBuilder(args);

// Configuraci�n de la cadena de conexi�n a la base de datos
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Agregar controladores
builder.Services.AddControllers();

// Configurar Swagger (opcional, pero �til para pruebas)
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar el middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapControllers();

app.Run();
