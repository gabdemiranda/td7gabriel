class PropertyLocationsController < ApplicationController
  def show
    id = params[:id]
    @property_location = PropertyLocation.find(id)
  end

  def new
    @property_location = PropertyLocation.new
  end

  def create
    @property_location = PropertyLocation.create(params.require(:property_location).permit(:name))
    if @property_location.save
      redirect_to @property_location
    else
      render :new
    end
  end
end