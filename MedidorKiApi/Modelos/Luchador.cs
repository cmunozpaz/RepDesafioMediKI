using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITLuchador")]
    public class Luchador
    {
        [Key]
        public int IdLuchador {get; set;}
        public string NombreLuchador { get; set; }

        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }

    }
}
