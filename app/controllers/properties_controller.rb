class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = Property.search(params).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save
      redirect_to properties_path
  end

  def edit
    @property = current_user.properties.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
        if @property.user == current_user
          @property.update(property_params)
        else
        end
      redirect_to properties_path
  end

  def destroy
    @property = current_user.properties.find(params[:id])
        if @property.user == current_user
          @property.destroy
        else
        end
     redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :address, :area, :apartment, :price, :property_type, :lat, :lng, :price_type)
  end

end
