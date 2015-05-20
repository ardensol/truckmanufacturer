class RegistrationsController < Devise::RegistrationsController
	
	def create
		super
		check_existing_quotes
	end

	def check_existing_quotes
		email = current_user.email
		@quote = Quote.find_by_email(email)
		if @quote != nil
			@quote.user_id = current_user.id
			@quote.save
		end
	end

end