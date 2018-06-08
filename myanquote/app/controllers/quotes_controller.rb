class QuotesController < ApplicationController

	def index
		@quote = Quote.order("RANDOM()").first
	end


	def new
		@quote = Quote.new
	end

	def create
		Quote.create(quote_params)
	end
end
