require 'nokogiri'
require 'open-uri'
require 'net/http'

class CrawlerService
    attr_accessor :quotes, :search

    def initialize(search)
        @search = search
        @quotes = Array.new
    end

    def scrape(url)
        Nokogiri::HTML(Net::HTTP.get(URI(url)))
    end
    
    def search
        doc = scrape("http://quotes.toscrape.com/tag/#{@search}/")
        quotes = doc.css('div.quote')
        quotes.each do |quote|
            title = quote.css('span.text').text
            author = quote.css('span small.author').text
            about = "http://quotes.toscrape.com#{quote.css('span a').attribute('href').value}" 
            tags = quote.css('div.tags meta.keywords').attribute('content').value.split(',')

            @quotes << {quote: title, author: author, author_about: about, tags: tags}  
        end
        @quotes
    end
end