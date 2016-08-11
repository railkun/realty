class ImagesController < ApplicationController
  before_action :authenticate_user!


  def create
    @property = Property.find(params[:property_id])
    @image = @property.images.new(image_params)
    @image.save
    redirect_to edit_property_path(@property)
  end

  def destroy
    @property = Property.find(params[:property_id])
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to edit_property_path(@property)
  end
  private

  def image_params
    params.require(:image).permit(:img_url, :property_id )
  end

  end
