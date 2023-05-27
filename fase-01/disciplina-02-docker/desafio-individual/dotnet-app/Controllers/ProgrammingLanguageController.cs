using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
}
