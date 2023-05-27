FROM mcr.microsoft.com/dotnet/sdk:6.0 as build

WORKDIR /src

COPY *.csproj .

RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o /publish


FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /opt/app

COPY --from=build /publish ./

RUN ls -la .

EXPOSE 80

ENTRYPOINT ["dotnet", "Olegon.Fiap.Soat.App.dll"]
