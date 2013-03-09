class CarsController < ApplicationController
  respond_to :json
  layout :false

  def index
    @cars = Car.all
    respond_with @cars
  end

  def show
    @car = Car.find(params[:id])
    respond_with @car
  end

  def new
    @car = Car.new
    respond_with @car
  end

  def edit
    @car = Car.find(params[:id])
    respond_with @car
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(params[:car])
      head :no_content
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    head :no_content
  end
end
