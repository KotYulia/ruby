class AirportsController < ApplicationController
  def new
    @airport = Airport.new(city: @city)
  end

  def create
    @city = City.find(params[:city_id])
    @airport = @city.airports.build(airport_params)
    if @airport.save
      redirect_to city_airport_path(@airport.city.id)
    else
      render 'new'
    end
  end

  def show
    @city = City.find(params[:city_id])
    @airport = @city.airports.find(params[:id])
  end

  def edit
    @airport = Airport.find(params[:id])
  end

  def update
    @airport = Airport.find(params[:id])
    if @airport.update_attributes(airport_params)
      redirect_to country_city_path(@airport.city.id)
    else
      render 'edit'
    end
  end

  def destroy
    @airport = Airport.find(params[:id])
    @airport.destroy
    redirect_to country_city_path(@airport.city.id)
  end

  private
  def airport_params
    params.require(:airport).permit(:city_id, :title, :image)
  end
end
