# DROID-MARKET-API

Esta API é destinada a realização de cotação de peças específicas de droids, atendendo asssim, as necessidades da Federação de Comércio.

## ARQUITETURA

Como foi definido pela Federação de Comercio, existem 3 entidades definidas na API: 

* Usuario
* Peça
* Demanda

Um Usuário além de ser responsável pela autenticação na API, possui as seguintes informações:

* nome
* telefone
* email
* tipo (Administrador, Anunciante)

Por padrão, se um tipo não for definido ao Usuário, ele será criado como do tipo Anunciante. Um Usuário pode possuir muitas Demandas.

Uma Peça é definida da seguinte forma:

* tipo
* descrição
* valor

Uma Peça pode possuir muitas Demandas.

Uma Demanda possui as seguintes informações:

* rua
* bairro
* cidade
* uf
* numero
* cep
* complemento
* situação (Aberta, Finalizada)

Os campos (rua, bairro, cidade, uf, numero, cep, complemento) formam a informação de endereço de entrega. A descrição da Peça é obtida através da relação de Demanda com peça, bem como as informações de contato do Usuário. Dessa forma uma Demanda pertence à um Usuário e à uma Peça.

## CONFIGURAÇÃO

A API foi desenvolvida em Ruby on Rails, utilizando a versão 2.6.1 do Ruby, e a versão 5.2.3 do Rails. O banco de dados utizliado é o MySQL.

A API atende aos padrões do JSON API, implementa autenticação, o padrão cliente-servidor, possui paginação e possibilita cacheamento, atendendo as CONSTRAINTS de APIs RESTFUL.

A aplicação será executada em um container Docker. Os arquivos Dockerfile e doker-compose encontram-se dentro da pasta doker-rails.

Antes de dar build no container é importante que a pasta /opt/mysql_data seja criada, desta forma seu banco de dados não será perdido quando o container for encerrado.

Abra o terminal e digite:
```
sudo mkdir /opt/mysql_data
```
Feito isso, é possível construir o container.

Para construir o container acesse a pasta docker-rails:
```
cd docker-rails/
```
Execute o comando abaixo para criar o container e subir a aplicação:
```
sudo docker-compose up
```
## EXECUTANDO

Com a API executando, é possível realizar as requisições necessárias para a aplicação.
Os endpoints foram gerados e exportados em uma Collection Postman (https://www.getpostman.com/). Os endpoints se encontram dentro da pasta postman. Em seguida importe os endpoints no Postman.

Vale lembrar que os endpoints estão nomeados para melhor compreensão do que realizam.

Primeiramente é necessário se cadastrar utilizando as requisições SIGN_UP. Existem duas requisições, uma para cada tipo de usuario.

Em seguida para se autenticar na API é necessário utilizar as requisições SIGN_IN.

A API utiliza a gem devise_token_auth,qeu é uma autenticação simples, multi-client e segura para o Rails. Por conta disso, nas requisições que exigem autenticação, envie no header da requisição os valores:

* access-token
* client
* uid

Para adquirir esses valores basta copiar do header do response da requisição SIGN_IN do usuário desejado.

Todas as requisições para GET, POST, PATCH, DELETE das entidades da API estão listadas na collection do Postman.

