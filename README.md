# Desafio Inovamind 

Crie um web crawler para efetuar uma busca de frases no site http://quotes.toscrape.com/.
As infomações vindas do crawler devem ser disponibilizadas por uma API. Esta API deve receber como
parâmetro uma tag e buscar por frases que estejam classificadas de acordo com esta tag.
As informações extraidas do site devem ser salvas no MongoDB que simulará um cache, onde caso a tag já
tenha sido pesquisada, deverá retornar os dados persistidos previamente no banco de dados.

## Tecnologias
* Ruby 3.0.1
* Rails 6.1.4
* Mongo 5.0.3

### Instalando projeto e dependencias

* Clonar a aplicação

* `git clone https://github.com/Jrolisilva/inovamind.git`

* cd inovamind/ 

* `bundle install`

* sudo service mongod start (iniciar o Mongodb)

* `rails s` (Setar o rails)

### Obtenção do Token de acesso

Faça o cadastro do email e senha
No end point: POST http://localhost:3000/api/v1/users


Após isso faça autenticação para receber o Token
No end point http://localhost:3000/api/v1/authenticate

Com o Token faça o acesso as buscas pelas quotes conforme mostrado abaixo

### End point

Buscar os quotes por tags: GET http://localhost:3000/api/v1/quotes/{tag desejada}

Buscar todos os quotes: GET  http://localhost:3000/api/v1/quotes/

### Funcionalidades

API utiliza MongoDB para criar um cache com as pesquisas de tags da seguinte forma:

* Obtém a palavra-chave pesquisada através do parâmetro `:search_tag`
* Acessa a URL http://quotes.toscrape.com/tag/#{search_tag} e salva a página como um arquivo HTML.
* Faz uma varredura no arquivo com Nokogiri, e cria um Array com as divs que contém a classe `.quote`
* É feita uma iteração no Array, separando os dados em citação, autor, link do autor, e tags.
* Renderiza o resultado da pesquisa do Banco em formato JSON.
