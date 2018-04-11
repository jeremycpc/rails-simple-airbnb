class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  def index
    @search_term = params[:query]
    if @search_term.length > 0
      @flats = Flat.where("name LIKE '%#{@search_term}%' \
        OR address LIKE '%#{@search_term}%'")
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
