class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else 
      render :new 
    end
  end
  
  def show
    select_song
    @artist = Artist.find_by_id(@song.id)
    @genre = Genre.find_by_id(@song.id)
  end
  
  def edit
    select_song
  end

  def update
    select_song
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private

  def select_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name)
  end

end