using Microsoft.AspNetCore.Mvc;

using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
   public class LuchadorController : Controller
   {
        private readonly AppDbContext _context;

public LuchadorController(AppDbContext context)
{
    _context = context;
}

[HttpGet]
[Route("ListaLuchadoresActivos")]
[AllowAnonymous]
public IActionResult GetLuchadoresActivos()
{
    var luchadoresActivos = _context.Luchador.Where(l => l.Estado == "1").ToList();
    return Ok(luchadoresActivos);
}
   }
}
