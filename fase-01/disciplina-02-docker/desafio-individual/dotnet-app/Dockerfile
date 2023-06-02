FROM mcr.microsoft.com/dotnet/sdk:6.0 as build

WORKDIR /src

COPY *.csproj .

RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o /publish


FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /opt/app

ENV ASPNETCORE_URLS=http://+:5000

COPY --from=build /publish ./

EXPOSE 5000

USER nobody

ENTRYPOINT ["dotnet", "Olegon.Fiap.Soat.App.dll"]
