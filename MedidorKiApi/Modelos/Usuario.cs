using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITUsuario")]
    public class Usuario
    {
        [Key]
        public int IdUsuario {get; set;}
        public string NombreUsuario { get; set; }
        public string CorreoUsuario { get; set; }
        public string ClaveUsuario { get; set; }

        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }




    }
}
