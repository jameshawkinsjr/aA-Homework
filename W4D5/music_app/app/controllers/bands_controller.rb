class BandsController < ApplicationController
    
    def index 
        render :index
    end
    def new
        @user = current_user
        render :new
    end

    def create
        @band = Band.new(name: params[:band][:name])
        if @band.save
            redirect_to band_url(@band)
        else
            flash[:errors] = ["Name cannot be blank"]
            redirect_to new_band_url
        end
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def destroy
        @band = Band.find(params[:id])
        @band.delete
        redirect_to band_url(@band)
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end

end
