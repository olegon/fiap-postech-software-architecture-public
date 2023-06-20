using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Olegon.Fiap.Soat.App.Entity;
using Olegon.Fiap.Soat.App.Model;
using Olegon.Fiap.Soat.App.Repository;

namespace Olegon.Fiap.Soat.App.Controllers;

[ApiController]

public class ProgrammingLanguageController : ControllerBase
{
    private readonly ProgrammingLanguageContext _dbContext;

    public ProgrammingLanguageController(ProgrammingLanguageContext dbContext)
    {
        this._dbContext = dbContext;
    }

    [HttpGet("/v1/programming-languages")]
    public Task<List<string>> ListProgrammingLanguages() => _dbContext.ProgrammingLanguages.Select(t => t.Name).ToListAsync();

    [HttpPost("/v1/programming-languages")]
    public async Task<ProgrammingLanguage> InsertProgrammingLanguage([FromBody] CreateProgrammingLanguageRequest payload)
    {
        var entry = _dbContext.Add<ProgrammingLanguage>(payload);

        await _dbContext.SaveChangesAsync();

        return entry.Entity;
    }
}
