using Microsoft.EntityFrameworkCore;
using Olegon.Fiap.Soat.App.Entity;
using Olegon.Fiap.Soat.App.Model;

namespace Olegon.Fiap.Soat.App.Repository;

public class ProgrammingLanguageContext : DbContext {
    public DbSet<ProgrammingLanguage> ProgrammingLanguages { get; set; } = null!;

    public ProgrammingLanguageContext(DbContextOptions options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ProgrammingLanguage>()
            .ToTable("programming_languages");

        modelBuilder.Entity<ProgrammingLanguage>()
            .Property(t => t.Id).HasColumnName("id");

        modelBuilder.Entity<ProgrammingLanguage>()
            .Property(t => t.Name).HasColumnName("name");
    }
}