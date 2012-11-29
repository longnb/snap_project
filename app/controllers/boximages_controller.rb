class BoximagesController < ApplicationController
before_filter :signed_in_user, only: [:index, :destroy, :edit, :new, :create]
     #before_filter :admin_user,     only: [:new, :edit, :destroy]

  def new
  	@boximage = Boximage.new
  end

  def destroy
    Boximage.find(params[:id]).destroy
    flash[:success] = "Boximage destroyed."
    redirect_to boximages_url
  end

  def show
  	@boximage = Boximage.find(params[:id])
  end

  def create
    @boximage = current_user.boximages.build(params[:boximage])
    if @boximage.save
      flash[:success] = "Boximage created!"
      redirect_to :controller => 'images', :action => 'new', :boximage => @boximage
    else
      render 'snap_projects/home'
    end
  end


  def edit
  	@boximage = Boximage.find(params[:id])
  end

  def update
  	@boximage = Boximage.find(params[:id])
  	if @boximage.update_attributes(params[:boximage])
  		# Handle a successful update.
  		flash[:success] = "Boximage information updated"
  		#sign_in @user
  		redirect_to boximages_url
  	else
  		render 'edit'
  	end
  end

  def index
  	@boximage = Boximage.all
  end

private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
