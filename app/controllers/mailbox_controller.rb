class MailboxController < ApplicationController
	before_action :logged_in_user

	def inbox
		@inbox = mailbox.inbox
		@active = :inbox
	end

	def sent
		@sent = mailbox.sentbox
		@active = :sent
	end

	def trash
		@trash = mailbox.trash
		@active = :trash
	end
	












  private
	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in to post"
        redirect_to login_url
      end
    end
end
