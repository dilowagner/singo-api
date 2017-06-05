# API Singo IE Validation - Golang

### Microservice API para validação das inscrições estaduais do Brasil

Validações implementadas de acordo com o [manual do Sintegra](http://www.sintegra.gov.br/insc_est.html).

## Exemplo de utilização
Para utilizar esta API você precisa ter o [Docker](https://www.docker.com) instalado.

- Clone o projeto
```shell
  git clone https://github.com/dilowagner/singo-api.git
```

- Acesse a pasta do projeto
```shell
  cd /path/singo-api
```

- Rode o build.
```shell
  docker build --rm -t singo-server .
```

- Rode o serviço na porta 8080
```shell
  docker run -p 8080:8080 --name="singo" -d singo-server
```
**Pronto!** Basta acessar o browser e digitar o endereço [http://localhost:8080](http://localhost:8080), você receberá a mensagem "API para validacao de inscrições estaduais".

Para utilizar a validação, acesse a rota http://localhost:8080/singo/:uf/:inscricao - passando o estado e a inscrição estadual.

EX: [http://localhost:8080/singo/BA/12345663](http://localhost:8080/singo/BA/12345663) - validando a inscrição do estado da Bahia

Caso você precise parar o container
```shell
  docker stop <CONTAINER-ID>
```
Para inicia-lo novamente
```shell
  docker start <CONTAINER-ID>
```

Caso queira removê-lo (após parar o container, ou utilize -f para forçar!)
```shell
  docker rm <CONTAINER-ID>
```
