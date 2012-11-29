class SnapProjectsController < ApplicationController
  def home
  	 @boximage = current_user.boximages.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
