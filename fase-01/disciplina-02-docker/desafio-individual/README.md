# Desafio individual - Docker compose

O desafio consiste em rodar uma aplicação bem simples utilizando o *Docker Compose*. A imagem da aplicação deve estar no *Docker Hub* e deve ser pública.

## Como subir a aplicação e rodar a aplicação?

### Versão Spring

```bash
# Subindo a aplicação
docker compose -f docker-compose-spring.yml up

# Testando a aplicação
curl -i http://localhost:8080/v1/programming-languages
``` 

### Versão dotnet

```bash
# Subindo a aplicação
docker compose -f docker-compose-dotnet.yml up

# Testando a aplicação
curl -i http://localhost:8080/v1/programming-languages
```
