class MixtapesController < ApplicationController
  before_action :check_for_login
  
  def new
    @mixtape = Mixtape.new
  end

  def create
    # create the mixtape
    mixtape = Mixtape.create mixtape_params
    # raise :hell
    if params[:mixtape][:images].present?
      params[:mixtape][:images].each do |image|
        req = Cloudinary::Uploader.upload(image)
        mixtape.images << req["public_id"]
      end
    end
    # associate the mixtape with the current user
    @current_user.mixtapes << mixtape
    # redirect_to root_path
    redirect_to root_path
  end

  def show
    @mixtape = Mixtape.find params[:id]
  end

  def edit
    @mixtape = Mixtape.find params[:id]
  end

  private
  def mixtape_params
    params.require(:mixtape).permit(:title, :id)
  end
end
