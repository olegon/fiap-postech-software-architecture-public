using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Olegon.Fiap.Soat.App.Entity;
using Olegon.Fiap.Soat.App.Model;
using Olegon.Fiap.Soat.App.Repository;

namespace Olegon.Fiap.Soat.App.Controllers;

[ApiController]

public class SysOpsController : ControllerBase
{
    private readonly ProgrammingLanguageContext _dbContext;

    public SysOpsController(ProgrammingLanguageContext dbContext)
    {
        this._dbContext = dbContext;
    }

    [HttpPost("/v1/sysops/ensure-database-created")]
    public Task EnsureCreated() => _dbContext.Database.EnsureCreatedAsync();
}
