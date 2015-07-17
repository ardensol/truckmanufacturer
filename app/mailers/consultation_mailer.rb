class ConsultationMailer < ActionMailer::Base
	default :from => "<csolorio05@gmail.com>"


	def new_message(consultation)
		@consultation = consultation
	    mail(:subject => "New Consultation Request!",
	    	bcc: @consultation.email )
  	end

  	def new_quote(quote)
  		@quote = quote
  		mail(subject: "New quote", bcc:"csolorio05@gmail.com")
  	end
end