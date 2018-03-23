class PresetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_preset, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @presets = Preset.all
    respond_with(@presets)
  end

  def show
    respond_with(@preset)
  end

  def new
    @preset = Preset.new
    respond_with(@preset)
  end

  def edit
  end

  def create
    @preset = Preset.new(preset_params)

    # uploaded_io = preset_params[:file_upload]
    # origin_filename = uploaded_io.original_filename
    # new_filename = Time.new.strftime("%Y%m%d%H%M%S") + origin_filename[origin_filename.index('.'),4]
    # file_name = Rails.root.join("public/uploads/presets", new_filename)
    # File.open(file_name, 'wb') do |file|
    #   file.write(uploaded_io.read)
    #   @preset.path = "public/uploads/presets/" + new_filename
    # end
    
    @preset.save
    respond_with(@preset)
  end

  def update
    @preset.update(preset_params)
    respond_with(@preset)
  end

  def destroy
    @preset.destroy
    respond_with(@preset)
  end

  private
    def set_preset
      @preset = Preset.find(params[:id])
    end

    def preset_params
      params[:preset].permit(:title, :path, :category_id, :file_upload, :status)
    end
end
