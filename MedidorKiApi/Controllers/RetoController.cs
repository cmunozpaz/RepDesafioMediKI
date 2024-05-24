using Microsoft.AspNetCore.Mvc;
using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
   public class RetoController : Controller
   {
        private readonly AppDbContext _context;

        public RetoController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("RetosPorCategoria")]
        [AllowAnonymous]
        public IActionResult GetRetosPorCategoria()
        {
            var retosActivosPorCategoria = _context.Reto
            .Where(r => r.Estado == "1")
            .GroupBy(r => r.CodigoCategoria)
            .Select(g => new 
            {
            Categoria = g.Key,
            Retos = g.ToList()
            })
        .ToList();
        return Ok(retosActivosPorCategoria);
        }
    }
}