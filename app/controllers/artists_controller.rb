class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]

  def index
    @artists = Artist.all
    @artist = Artist.new
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html {
          redirect_to artist_path(@artist),
          notice: 'Artist was successfully created.'
        }
        format.js
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html {
          redirect_to @artist,
          notice: 'Artist was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html {
        redirect_to artists_path,
        notice: 'Artist was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :year)
    end
end
