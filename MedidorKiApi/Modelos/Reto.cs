using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITReto")]
    public class Reto
    {
        [Key]
        public int IdReto {get; set;}
        public string NombreReto { get; set; }

        public int CodigoCategoria {get; set;}

        public DateTime FechaInserto { get; set; }
        public string UsuarioInserto { get; set; }

        public DateTime FechaModifico { get; set; }
        public string UsuarioModifico { get; set; }
        
        public string Estado { get; set; }

    }
}
