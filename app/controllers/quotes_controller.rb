class QuotesController < ApplicationController
	before_action :set_quote, only: [:show, :edit, :update, :destroy]
	def new
		@quote = Quote.new

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: quote }
	    end
	end

	def create
		if current_user
			@quote = current_user.quotes.new(quote_params)
			@quote.user_id = current_user.id
		else
			@quote = Quote.new(quote_params)
		end

	    respond_to do |format|
	      if @quote.save
	        format.html { redirect_to @quote, notice: 'Your Quote Has Been Processed.' }
	        format.json { render action: 'show', status: :created, location: @quote }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @quote.errors, status: :unprocessable_entity }
	      end
	    end

	end

	def show
		@bids = @quote.bids 
	end

	private

	def set_quote
		@quote = Quote.find(params[:id])
	end

	def quote_params
      params.require(:quote).permit(:email, :name, :field, :description, :location, :user_id)
    end
end