class PresetCategoriesController < ApplicationController
  before_action :set_preset_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @preset_categories = PresetCategory.all
    respond_with(@preset_categories)
  end

  def show
    respond_with(@preset_category)
  end

  def new
    @preset_category = PresetCategory.new
    respond_with(@preset_category)
  end

  def edit
  end

  def create
    @preset_category = PresetCategory.new(preset_category_params)
    @preset_category.save
    respond_with(@preset_category)
  end

  def update
    @preset_category.update(preset_category_params)
    respond_with(@preset_category)
  end

  def destroy
    @preset_category.destroy
    respond_with(@preset_category)
  end

  private
    def set_preset_category
      @preset_category = PresetCategory.find(params[:id])
    end

    def preset_category_params
      params[:preset_category]
    end
end
