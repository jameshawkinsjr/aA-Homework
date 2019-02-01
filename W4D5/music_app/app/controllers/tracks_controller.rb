class TracksController < ApplicationController
    def new
        render :new
    end

    def create
        @track = Track.new(title: params[:track][:title],ord: params[:track][:ord],album_id: params[:track][:album_id],regular: params[:track][:regular])
        if @track.save
            redirect_to album_url(@track.album_id)
        else
            flash[:errors] = ["Please fill everything out"]
            render :new
        end
    end

    def show
        @track = Track.find(params[:id])
        render :show
    end

    def destroy
        @track = Track.find(params[:id])
        @track.delete
        redirect_to album_url(@track.album_id)
    end

    private

    def track_params
        params.require(:track).permit(:regular, :title, :ord, :album_id)
    end

end