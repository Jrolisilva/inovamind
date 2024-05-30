# Desafio Inovamind 

Create a web crawler to search for quotes on the website http://quotes.toscrape.com/. 
The information obtained from the crawler should be made available through an API. 
This API should accept a tag as a parameter and search for quotes that are classified according to this tag. 
The information extracted from the website should be saved in MongoDB, which will simulate a cache. 
If the tag has already been searched for, it should return the previously stored data from the database.

## Tech
* Ruby 3.0.1
* Rails 6.1.4
* Mongo 5.0.3

### Install dependecies

* Clone app

* `git clone https://github.com/Jrolisilva/inovamind.git`

* cd inovamind/ 

* `bundle install`

* sudo service mongod start (iniciar o Mongodb)

* `rails s` (Setar o rails)

### Get access token

Register the email and password at the endpoint: POST http://localhost:3000/api/v1/users

After that, authenticate to receive the Token at the endpoint: http://localhost:3000/api/v1/authenticate

Use the Token to access the quotes searches as shown below:

### Endpoints
Search quotes by tags: GET http://localhost:3000/api/v1/quotes/{desired tag}

Search all quotes: GET http://localhost:3000/api/v1/quotes/

Features
The API uses MongoDB to create a cache with the tag searches as follows:

* Obtains the searched keyword through the :search_tag parameter
*Accesses the URL http://quotes.toscrape.com/tag/#{search_tag} and saves the page as an HTML file.
* Scans the file with Nokogiri and creates an Array with the divs that contain the .quote class.
* Iterates over the Array, separating the data into quote, author, author's link, and tags.
* Renders the search result from the database in JSON format.
