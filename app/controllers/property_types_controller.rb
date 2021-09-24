class PropertyTypesController < ApplicationController
  def show
    id = params[:id]
    @property_type = PropertyType.find(id)
  end
    
  def new
    @property_type = PropertyType.new
  end
    
  def create
    @property_type = PropertyType.create(params.require(:property_type).permit(:name))
    if @property_type.save
      redirect_to @property_type
    else
      render :new
    end
  end
end