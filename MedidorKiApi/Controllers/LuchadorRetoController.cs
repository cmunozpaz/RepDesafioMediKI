using Microsoft.AspNetCore.Mvc;

using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
   public class LuchadorRetoController : Controller
   {
        private readonly AppDbContext _context;

        public LuchadorRetoController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("ListaLuchadorRetoActivos")]
        [AllowAnonymous]
        public IActionResult GetLuchadoresRetosActivos()
        {
        var luchadoresRetoActivos = _context.LuchadorReto
            .Where(lp => lp.Estado == "1")
            .Join(_context.Luchador,
                lp => lp.IdLuchador,
                l => l.IdLuchador,
                (lp, l) => new { lp, l })
            .Join(_context.Reto,
                lp_l => lp_l.lp.IdReto,
                p => p.IdReto,
                (lp_l, p) => new 
                {
                    IdLuchadorReto = lp_l.lp.IdLuchadorReto,
                    LuchadorReto = lp_l.lp.IdLuchadorReto + " - " + lp_l.l.NombreLuchador + " - " + p.NombreReto
                })
            .ToList();

            return Ok(luchadoresRetoActivos);
}
    }
}
