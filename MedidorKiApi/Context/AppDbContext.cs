using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MedidorKi.Modelos;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Extensions;



namespace MedidorKi.Context
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {

        }

        public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
        {
        }

        //public virtual DbSet<Usuarios> Usuarios { get; set; } = null!;
        public virtual DbSet<Usuario> Usuario { get; set; } = null!;
        public virtual DbSet<Luchador> Luchador { get; set; } = null!;
        public virtual DbSet<Categoria> Categoria { get; set; } = null!;
        public virtual DbSet<Reto> Reto { get; set; } = null!;

        public virtual DbSet<Personaje> Personaje { get; set; } = null!;

        public virtual DbSet<LuchadorPersonaje> LuchadorPersonaje { get; set; } = null!;
         
        public virtual DbSet<LuchadorReto> LuchadorReto { get; set; } = null!;
        public virtual DbSet<Calificacion> Calificacion { get; set; } = null!;
        

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(local); DataBase=MEKITUsuario;Integrated Security=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("PK__IdUsuario__123456");

                entity.ToTable("MEKITUsuario");

                entity.Property(e => e.NombreUsuario)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CorreoUsuario)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                    entity.Property(e => e.ClaveUsuario)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            
            modelBuilder.Entity<Luchador>(entity =>
            {
                entity.HasKey(e => e.IdLuchador)
                    .HasName("PK__IdLuchador__123456");

                entity.ToTable("MEKITLuchador");

                entity.Property(e => e.NombreLuchador)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<Categoria>(entity =>
            {
                entity.HasKey(e => e.CodigoCategoria)
                    .HasName("PK__CodigoCategoria__123456");

                entity.ToTable("MEKICategoria");

                entity.Property(e => e.NombreCategoria)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<Reto>(entity =>
            {
                entity.HasKey(e => e.IdReto)
                    .HasName("PK__IdReto__123456");

                entity.ToTable("MEKITReto");

                entity.Property(e => e.NombreReto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.CodigoCategoria)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<Personaje>(entity =>
            {
                entity.HasKey(e => e.IdPersonaje)
                    .HasName("PK__IdPersonajeo__123456");

                entity.ToTable("MEKITPersonaje");

                entity.Property(e => e.NombrePersonaje)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Imagen)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.PoderInicial)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.PoderFinal)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<LuchadorPersonaje>(entity =>
            {
                entity.HasKey(e => e.IdLuchadorPersonaje)
                    .HasName("PK__IdLuchadorPersonaje__123456");

                entity.ToTable("MEKITLuchadorPersonaje");

                entity.Property(e => e.IdLuchador)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.IdPersonaje)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<LuchadorReto>(entity =>
            {
                entity.HasKey(e => e.IdLuchadorReto)
                    .HasName("PK__IdLuchadorReto__123456");

                entity.ToTable("MEKITLuchadorReto");

                entity.Property(e => e.IdLuchador)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.IdReto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Punteo)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                      entity.Property(e => e.NumeroEsferas)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

             modelBuilder.Entity<Calificacion>(entity =>
            {
                entity.HasKey(e => e.IdCalificacion)
                    .HasName("PK__IdCalificacion__123456");

                entity.ToTable("MEKITCalificacion");

                entity.Property(e => e.IdLuchadorPersonaje)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.IdLuchadorReto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Punteo)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaInserto)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.UsuarioModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.FechaModifico)
                    .HasMaxLength(255)
                    .IsUnicode(false);
                    entity.Property(e => e.Estado)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });





            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}