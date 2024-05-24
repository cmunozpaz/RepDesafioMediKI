using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKICategoria")]
    public class Categoria
    {
        [Key]
        public int CodigoCategoria {get; set;}
        public string NombreCategoria { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioInserto { get; set; }

        public DateTime FechaModifico { get; set; }
        public string UsuarioModifico { get; set; }
        
        public string Estado { get; set; }

    }
}
