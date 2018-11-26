class CitiesController < ApplicationController
=begin
  def index
    @country = Country.find(params[:country_id])
    @city = @country.cities.all
  end
=end

  def new
    @city = City.new(country: @country)
  end

  def create
    @country = Country.find(params[:country_id])
    @city = @country.cities.build(city_params)
    if @city.save
      redirect_to country_path(@city.country.id)
    else
      render 'new'
    end
  end

  def show
    @country = Country.find(params[:country_id])
    @city = @country.cities.find(params[:id])
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      redirect_to country_path(@city.country.id)
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to country_path(@city.country.id)
  end

  private
  def city_params
    params.require(:city).permit(:country_id, :title, :image)
  end

end
