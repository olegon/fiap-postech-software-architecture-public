# Desafio individual - Docker compose

O desafio consiste em rodar uma aplicação bem simples utilizando o *Docker Compose*. A imagem da aplicação deve estar no *Docker Hub* e deve ser pública.

## Como subir a aplicação?

Para subir a aplicação via Docker Compose, rode:

```bash
docker compose up
``` 

## Como usar a aplicação?

Após subir a aplicação, rode:

```bash
curl -i http://localhost:8080/v1/programming-languages
```
