class BandsController < ApplicationController
  before_action :logged_in?

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def create
    @band = Band.new(band_params)

      if @band.save
        redirect_to band_url(@band)
      else
        flash[:errors] = "Invalid Band Name"
        render :edit
      end
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_url
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
