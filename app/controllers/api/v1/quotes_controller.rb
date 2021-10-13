class Api::V1::QuotesController < ApplicationController
    def index
        @quotes = Quote.order('author Asc')
        render json: @quotes, root: 'quotes'
    end
end