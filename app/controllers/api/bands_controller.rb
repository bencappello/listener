class Api::BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      render :show
    else
      render json: @band.errors.full_messages
    end
  end

  def show
    @band = Band.includes(:tags, songs: :blog, comments: :author).find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      flash[:notice] = "#{@band.name} added successfully"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
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
