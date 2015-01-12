class Api::BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      render :show
    else
      render json: @band.errors.full_messages, status: 422
    end
  end

  def show
    @band = Band.includes(:tags, songs: :blog, comments: :author).find(params[:id])
    render :show
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      render :show
    else
      render json: @band.errors.full_messages, status: 422
    end
  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end


  private

  def band_params
    params.require(:band).permit(:name, tag_ids: [])
  end
end
