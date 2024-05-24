using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITPersonaje")]
    public class Personaje
    {
        [Key]
        public int IdPersonaje {get; set;}
        public string Imagen { get; set; }
        public string NombrePersonaje { get; set; }

        public int PoderInicial { get; set; }
        public int PoderFinal { get; set; }

        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }

    }
}
