namespace ePMO.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Pengguna")]
    public partial class Pengguna
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Pengguna()
        {
            PencapaianPrograms = new HashSet<PencapaianProgram>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Nama { get; set; }

        [StringLength(100)]
        public string Jawatan { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string Katalaluan { get; set; }

        [StringLength(20)]
        public string NoStaf { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PencapaianProgram> PencapaianPrograms { get; set; }
    }
}
