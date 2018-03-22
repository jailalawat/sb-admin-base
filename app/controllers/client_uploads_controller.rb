class ClientUploadsController < ApplicationController
  
  include ImagesHelper
  skip_before_filter :verify_authenticity_token  

  respond_to :html

  def index
    render 'index'
  end

  def asset
    @photo = Photo.new
  end
  
  def asset_post
    
    @photo = Photo.new(photo_params)
    
    @photo.title = "Title"
    if @photo.save
        flash[:success] = 'Photo added!'
        render :json => {success: true, data: @photo.image_data}
    else
        puts YAML::dump(@photo)
        render :json, {success: false, message: @photo.errors}
    end
    
    #redirect_to "/home/index"

  end


  def json_post
    @json = Transcript.new(json_params)

    @json.save
    render :text => 'ok'

  end

  def json
    cart_id = params[:cart_id]
    json = Transcript.find_by({:cart_id => cart_id})
    #render json content    
  end


  private
  
  def photo_params
    params.permit(:title, :image)
  end

  def json_params
    params.permit(:content, :cart_id)
  end
end
