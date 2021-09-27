class PropertyLocationsController < ApplicationController
  def show
    id = params[:id]
    @property_location = PropertyLocation.find(id)
  end

  def new
    @property_location = PropertyLocation.new
  end

  def create
    @property_location = PropertyLocation.new(property_location_params)
    if @property_location.save
      redirect_to @property_location
    else
      render :new
    end
  end

  def property_location_params
    params.require(:property_location).permit(:name)
  end
end
