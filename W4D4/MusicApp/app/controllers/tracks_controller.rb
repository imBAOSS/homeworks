class TracksController < ApplicationController
  before_action :logged_in?

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.find_by(album_id: params[:album_id]) || Track.new
    render :new
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def create
    @track = Track.new(track_params)

      if @track.save
        redirect_to album_url(@track.album_id)
      else
        flash[:errors] = @track.errors.full_messages
        render :new
      end
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.erors.full_messages
      render :edit
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    redirect_to album_url(track.album_id)
    track.destroy
  end

  private

    def track_params
      params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
    end
end
