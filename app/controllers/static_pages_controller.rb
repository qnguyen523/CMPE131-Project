class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:help, :about]
  def help
  end

  def about
  end
end
