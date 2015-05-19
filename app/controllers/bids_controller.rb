class BidsController < ApplicationController
	before_action :set_bid, only: [:show, :edit, :update, :destroy]

	def new
		@bid = Bid.new
		@quote = Quote.find_by_id(params[:quote_id])

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @bid }
	    end
	end
	
	def create
		@bid = current_user.bids.new(bid_params)
		@bid.user_id = current_user.id
		@bid.quote_id = params[:quote_id]
			
	    respond_to do |format|
	      if @bid.save
	        format.html { redirect_to root_path, notice: 'Your Bid Has Been Processed.' }
	        format.json { render action: 'show', status: :created, location: @bid }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @bid.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show
		@quote = Quote.find_by_id(params[:quote_id])
		@commentable = @bid
		@comments = @commentable.comments
		@comment = Comment.new
	end

	private

	def set_bid
		@bid = Bid.find(params[:id])
	end


	def bid_params
      params.require(:bid).permit(:user_id, :quote_id, :description, :amount, :name)
    end

end