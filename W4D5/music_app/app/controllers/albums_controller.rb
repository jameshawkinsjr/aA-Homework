class AlbumsController < ApplicationController
    def new
        render :new
    end

    def create
        @album = Album.new(title: params[:album][:title],year: params[:album][:year],band_id: params[:album][:band_id],studio: params[:album][:studio])
        if @album.save
            redirect_to band_album_url(@album.band_id, @album.id)
        else
            flash[:errors] = ["Please fill everything out"]
            render :new
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def destroy
        @album = Album.find(params[:id])
        @album.delete
        redirect_to band_url(@album.band_id)
    end

    private

    def album_params
        params.require(:album).permit(:studio, :title, :year, :band_id)
    end

end