using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITCalificacion")]
    public class Calificacion
    {
        [Key]
        public int IdCalificacion {get; set;}
        public int IdLuchadorPersonaje {get; set;}
        public int IdLuchadorReto {get; set;}

        public decimal Punteo {get; set;}
        
        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }

    }
}
