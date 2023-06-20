using Olegon.Fiap.Soat.App.Entity;

namespace Olegon.Fiap.Soat.App.Model;

public class CreateProgrammingLanguageRequest
{
    public string Name { get; set; }

    public CreateProgrammingLanguageRequest(string name)
    {
        Name = name;
    }

    public static implicit operator ProgrammingLanguage(CreateProgrammingLanguageRequest r) => new ProgrammingLanguage(null, r.Name);
}
