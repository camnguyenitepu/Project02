class Admin::MovietypesController < Admin::ApplicationController
  before_action :movietype_read, except: %W(index create new)
  def index
  	@movietypes = Movietype.all
  end

  def create
    @movietypes = Movietype.new movietype_params
    if @movietypes.save
       flash[:suscces] = t "suscess"
      redirect_to admin_movietypes_path
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def new
    @movietypes = Movietype.new
  end

  def edit
    
  end

  def update
    if @movietypes.update_attributes movietype_params
      flash[:suscces] = t "suscess"
      redirect_to admin_movietypes_path
    else
      flash[:danger] = t "danger"
      render :edit
    end
  end

  def destroy
  end

  private

  def movietype_params
  	params.require(:movietype).permit :name, :status
  end

  def movietype_read
    @movietypes = Movietype.find_by id: params[:id]
  end
end