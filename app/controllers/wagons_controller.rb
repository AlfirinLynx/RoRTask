class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  # GET /wagons
  def index
    @wagons = Wagon.all
  end

  # GET /wagons/1
  def show
  end

  # GET /wagons/new
  def new
    @wagon = Wagon.new
  end

  # GET /wagons/1/edit
  def edit
  end

  # POST /wagons
  def create
    @wagon = Wagon.new(wagon_params)

    if @wagon.save
      redirect_to @wagon
    else
      render :new 
    end
  end

  # PATCH/PUT /wagons/1
  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon
    else
      render :edit
    end
  end

  # DELETE /wagons/1
  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private
    # Use callbacks to share common setup or conswagonts between actions.
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wagon_params
      params.require(:wagon).permit(:number, :train_id, :lower_seats, :upper_seats, :wagon_type)
    end
end
