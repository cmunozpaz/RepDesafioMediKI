using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedidorKi.Modelos
{
     [Table("MEKITLuchadorReto")]
    public class LuchadorReto
    {
        [Key]
        public int IdLuchadorReto {get; set;}
        public int IdLuchador {get; set;}
        public int IdReto {get; set;}

        public int Punteo {get; set;}
        public int NumeroEsferas {get; set;}

        public string UsuarioInserto { get; set; }

        public DateTime FechaInserto { get; set; }
        public string UsuarioModifico { get; set; }
        public DateTime FechaModifico { get; set; }
        public string Estado { get; set; }

    }
}
