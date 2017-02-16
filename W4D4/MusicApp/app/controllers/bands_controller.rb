class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    @band = Band.new(band_params)

      if @band.save
      else
      end

  end

  def update
      if @band.update(band_params)
      else
      end
  end

  def destroy
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
