using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITLuchadorPersonaje")]
    public class LuchadorPersonaje
    {
        [Key]
        public int IdLuchadorPersonaje {get; set;}
        public int IdLuchador {get; set;}
        public int IdPersonaje {get; set;}

        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }

    }
}
