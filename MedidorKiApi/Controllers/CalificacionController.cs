using Microsoft.AspNetCore.Mvc;

using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;
using MedidorKi.Modelos;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
   public class CalificacionController : Controller
   {
        private readonly AppDbContext _context;

        public CalificacionController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("ListaCalificacionesActivas")]
        [AllowAnonymous]
        public IActionResult GetCalificacionesActivas()
        {
            //var calificacionesActivas = _context.Calificacion.Where(l => l.Estado == "1").ToList();
            var query = from c in _context.Calificacion
            join lp in _context.LuchadorPersonaje on c.IdLuchadorPersonaje equals lp.IdLuchadorPersonaje
            join l in _context.Luchador on lp.IdLuchador equals l.IdLuchador
            join p in _context.Personaje on lp.IdPersonaje equals p.IdPersonaje
            join lr in _context.LuchadorReto on c.IdLuchadorReto equals lr.IdLuchador
            join r in _context.Reto on lr.IdReto equals r.IdReto
            where c.Estado == "1"
            select new 
            {
                IdCalificacion = c.IdCalificacion,
                IdLuchadorPersonaje = c.IdLuchadorPersonaje,
                LuchadorPersonaje = c.IdLuchadorPersonaje.ToString() + " - " + l.NombreLuchador + " - " + p.NombrePersonaje,
                IdLuchadorReto = c.IdLuchadorReto,
                LuchadorReto = c.IdLuchadorReto.ToString() + " - " + l.NombreLuchador + " - " + p.NombrePersonaje,
                Punteo = c.Punteo
            };
            var luchadoresPersonajesActivos = query.ToList();
            //return Ok(luchadoresPersonajesActivos);

            return StatusCode(StatusCodes.Status200OK, new { mensaje = "ok" , response = luchadoresPersonajesActivos });
            
        }

        [HttpPost]
        [Route("CrearCalificacion")]
        [AllowAnonymous]
        public IActionResult Create([FromBody] Calificacion newCalificacion)
        {
            if (ModelState.IsValid)
            {
                _context.Calificacion.Add(newCalificacion);
                _context.SaveChanges();

                //return Ok(newCalificacion);
                return StatusCode(StatusCodes.Status200OK, new { mensaje = "agregado", response = newCalificacion });
            }

            //return BadRequest(ModelState);
            return StatusCode(StatusCodes.Status200OK, new { mensaje = "agregado", response = newCalificacion });
        }

        [HttpPut]
        [Route("EditarCalificacion")]
        [AllowAnonymous]
        public IActionResult EditarCalificacion( [FromBody] Calificacion modificacion)
        {
            var calificacion = _context.Calificacion.Find(modificacion.IdCalificacion);

            if (calificacion == null)
            {
                return NotFound();
            }

            calificacion.Punteo = modificacion.Punteo;
            calificacion.UsuarioModifico = modificacion.UsuarioModifico;
            calificacion.FechaModifico = modificacion.FechaModifico;

            _context.Calificacion.Update(calificacion);
            _context.SaveChanges();

            //return Ok(calificacion);
            return StatusCode(StatusCodes.Status200OK, new { mensaje = "Editado", response = calificacion });
        }

        [HttpPut]
        [Route("EliminarCalificacion")]
        [AllowAnonymous]
        public IActionResult EliminarCalificacion( [FromBody] Calificacion Eliminar)
        {
            var calificacion = _context.Calificacion.Find(Eliminar.IdCalificacion);

            if (calificacion == null)
            {
                return NotFound();
            }

            calificacion.Estado = Eliminar.Estado;
            

            _context.Calificacion.Update(calificacion);
            _context.SaveChanges();

            //return Ok(calificacion);
            return StatusCode(StatusCodes.Status200OK, new { mensaje = "Elimina", response = calificacion });
        }
    }

}


