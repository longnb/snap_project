class ImagesController < ApplicationController
before_filter :signed_in_user, only: [:index, :destroy, :edit, :new, :create]
#before_filter :correct_user, only: [ :destroy, :edit, :new]

  def like
    #@current_user = User.find_by_id(params[:id])
     @image = Image.find(params[:id])
     #@current_user = User.find(params[:id])
     #@current_user = User.find(params[:boximage])

    if current_user.flagged?(@image, :like)
       current_user.unflag(@image, :like)
       msg = "You now don't like this image"
    else 
       current_user.flag(@image, :like)

       msg = "You now like this image"
    end  



    # @current_user.flag(@image, :like)
    redirect_to image_path, :notice => msg
    #redirect_to @image, :notice => "You like this image"
  end

  def index
    @images = Image.all
  end

  def show
    #@current_user = User.find_by_id(params[:id])
     #@current_user = User.first
     #@current_user = User.find(params[:id])
     #@current_user = User.find(params[:boximage])

     @image = Image.find(params[:id])
     previous_rs = Image.find_by_id_and_boximage_id(@image.id-1, @image.boximage_id )
     @previous = previous_rs unless previous_rs.nil?
     next_rs = Image.find_by_id_and_boximage_id(@image.id+1, @image.boximage_id )
     @next = next_rs unless next_rs.nil?
  end

  def new
      @image = Image.new
      @boximage = params[:boximage]
  end


  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:success] = "Image created!"
      redirect_to :controller => 'boximages', :action => 'show', :id => @image.boximage_id 
    else
     flash[:error] = "Image information error"
     
      redirect_to :controller => 'images', :action => 'new', :boximage => @image.boximage_id 
    end 
  end

  def update
     @image = Image.find(params[:id])
     if @image.update_attributes(params[:image])
     redirect_to @image
     flash[:success] = "Image information updated"
     else
     render action: "edit"
     end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_url
  end
 

private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:boximage])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
