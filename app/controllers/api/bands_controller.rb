class Api::BandsController < ApplicationController
  def index
    @bands = Band.all
    render json: @bands
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:notice] = "#{@band.name} added successfully"
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render json: @band
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
