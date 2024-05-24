using Microsoft.AspNetCore.Mvc;

using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
   public class LuchadorPersonajeController : Controller
   {
        private readonly AppDbContext _context;

        public LuchadorPersonajeController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("ListaLuchadorPersonajesActivos")]
        [AllowAnonymous]
        public IActionResult GetLuchadoresPersonajesActivos()
        {
        var luchadoresPersonajesActivos = _context.LuchadorPersonaje
            .Where(lp => lp.Estado == "1")
            .Join(_context.Luchador,
                lp => lp.IdLuchador,
                l => l.IdLuchador,
                (lp, l) => new { lp, l })
            .Join(_context.Personaje,
                lp_l => lp_l.lp.IdPersonaje,
                p => p.IdPersonaje,
                (lp_l, p) => new 
                {
                    IdLuchadorPersonaje = lp_l.lp.IdLuchadorPersonaje,
                    LuchadorPersonaje = lp_l.lp.IdLuchadorPersonaje + " - " + lp_l.l.NombreLuchador + " - " + p.NombrePersonaje
                })
            .ToList();

            return Ok(luchadoresPersonajesActivos);
}
    }
}
