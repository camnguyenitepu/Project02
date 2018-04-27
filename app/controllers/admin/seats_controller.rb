class Admin::SeatsController < Admin::ApplicationController
  before_action :seat_read, except: %W(index create new)
  def index
  	@seats = Seat.all
  end

  def create
    @seat = Seat.new seat_params
    if @seat.save
       flash[:suscces] = t "suscess"
      redirect_to admin_seats_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @seat = Seat.new
    @list_cinemaroom = Cinemaroom.all.map { |lst| [lst.name, lst.id] }
  end

  def edit
    @list_cinemaroom = Cinemaroom.all.map { |lst| [lst.name, lst.id] }
  end

  def update
    if @seat.update_attributes seat_params
      flash[:suscces] = t "suscess"
      redirect_to admin_seats_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def seat_params
  	params.require(:seat).permit :num_of_row, :num_of_collum, 
      :seat_type, :cinemaroom_id, :status
  end

  def seat_read
    @seat = Seat.find_by id: params[:id]
  end
end
