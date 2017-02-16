class AlbumsController < ApplicationController

  def index
    @album = Album.all
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def edit
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
      if @album.update(album_params)
      else
      end

  end

  def destroy


  end

  private

    def album_params
      params.require(:album).permit(:name, :band_id, :album_type)
    end
end
