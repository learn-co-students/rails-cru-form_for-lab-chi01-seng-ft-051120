class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genre_path(@genre)
    else 
      render :new 
    end
  end
  
  def show
    select_genre
  end
  
  def edit
    select_genre
  end

  def update
    select_genre
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  private

  def select_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
