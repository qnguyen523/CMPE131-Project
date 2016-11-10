class ConversationsController < ApplicationController
	before_action :logged_in_user

	def new
		
	end

	def create
		recipients = User.find(conversation_params[:recipients].to_i)
		conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
		flash[:success] = "Message sent to "+recipients.first
		redirect_to conversation_path(conversation)
	end

	def show
		@receipts = conversation.receipts_for(current_user)
		conversation.mark_as_read(current_user)
	end

	def reply
		current_user.reply_to_conversation(conversation, message_params[:body])
		flash[:success] = "Your reply was sent"
		redirect_to conversation_path(conversation)
	end

	def trash
		conversation.move_to_trash(current_user)
		flash[:success] = "The conversation was moved to trash"
		redirect_to conversation_path(conversation)
	end

	def untrash
		conversation.untrash(current_user)
		flash[:success] = "The conversation was successfully untrash"
		redirect_to mailbox_inbox_path
	end
	
	private
	 def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in to post"
        redirect_to login_url
      end
    end

    def conversation_params
    	params.require(:conversation).permit(:subject, :body, :recipients)
    end

    def message_params
    	params.require(:message).permit(:body, :subject)
    end

end
