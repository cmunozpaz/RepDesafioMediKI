using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MedidorKi.Modelos;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using MedidorKi.Context;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using BCrypt.Net;

namespace RESTAPI_CORE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutenticacionController : Controller
    {
        //LLave secreta
        private readonly string secretkey;
        public readonly AppDbContext _context;

        //Crear el constructor
        public AutenticacionController(IConfiguration config, AppDbContext context) {
            secretkey = config.GetSection("settings").GetSection("secretkey").ToString();

            _context =  context;
        }

        [HttpPost]
        [Route("Validar")]
        [AllowAnonymous]
       
        //[EnableCors("ReglasCors")]    




        public IActionResult Validar([FromBody] Usuario request)
        {
            // Retrieve the user and password from the request
            string IngresaCorreo = request.CorreoUsuario;
            string IngresaClave = request.ClaveUsuario;

            /* string correoBase ="";
            string claveBase ="";

            string correoBaseConsulta = "";
            string claveBaseConsulta = "";  */
            

            // TODO: Compare the user and password against the database
            // You can use the _context variable to access your database

            // Example code to check if the user and password are valid


            string passwordFromFrontEnd = request.ClaveUsuario;

            //string passwordHash = BCrypt.Net.BCrypt.HashPassword(passwordFromFrontEnd);


            //var usuario1 = _context.Usuario.Where(Usuario => Usuario.correo.Equals(request.correo) ).ToList();
            var usuario = _context.Usuario.FirstOrDefault(Usuario => Usuario.CorreoUsuario.Equals(request.CorreoUsuario));

            /* foreach (var user in usuario1)
            {
                // Access the properties of each user in the list
                correoBaseConsulta = user.correo;
                claveBaseConsulta = user.clave;

                // Do something with the user's information
                // ...
            } */

            //string storedHash = usuario.clave;

            if (usuario != null && !string.IsNullOrEmpty(usuario.ClaveUsuario))
            {
                 bool verified = BCrypt.Net.BCrypt.Verify(passwordFromFrontEnd, usuario.ClaveUsuario);

                 if (verified)
                 {
                    var keyBytes = Encoding.ASCII.GetBytes(secretkey);
                    var claims = new ClaimsIdentity();


                    claims.AddClaim(new Claim(ClaimTypes.NameIdentifier, IngresaCorreo));

                    var tokenDescriptor = new SecurityTokenDescriptor
                    {
                        Subject = claims,
                        Expires = DateTime.UtcNow.AddMinutes(5),
                        SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                    };

                    var tokenHandler = new JwtSecurityTokenHandler();
                    var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);

                    string tokencreado = tokenHandler.WriteToken(tokenConfig);

                    return StatusCode(StatusCodes.Status200OK, new { token = tokencreado, id = usuario.IdUsuario, correo = usuario.CorreoUsuario, nombre = usuario.NombreUsuario});
                    
                    }
                    else
                    {
                        return Ok(new { token = "" });
                    }
            }
            else
            {
            //return StatusCode(StatusCodes.Status401Unauthorized, new { token = "" });
            return Ok(new { token = "" });
            }
        }
        
    }
}
