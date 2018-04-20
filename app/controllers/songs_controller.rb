class SongsController < ApplicationController
  before_action :set_artist_album
  before_action :set_album_song, only: %i[show edit update destroy]

  def index
    @songs = @album.songs.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to artist_album_song_path(@artist, @album, @song), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to artist_album_song_path(@artist, @album, @song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to artist_album_songs_path, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_artist_album
      @artist = Artist.find(params[:artist_id])
      @album = Album.find(params[:album_id])
    end

    def set_album_song
      @song = @album.songs.find_by!(id: params[:id]) if @album
    end

    def song_params
      params.require(:song).permit(:name, :duration, :album_id)
    end
end
