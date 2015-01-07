class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    @tag_ids = []
    render :new
  end

  def create
    @band = Band.new(band_params)

    if params[:tag_ids] == [""]
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = ["Must select a tag"]
      render :new
    elsif @band.save
      @band.update_tags(params[:tag_ids])
      flash[:notice] = "#{@band.name} added successfully"
      redirect_to band_url(@band.id)
    else
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    @tag_ids = @band.tags.pluck(:id).map(&:to_s)
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if params[:tag_ids] == [""]
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = ["Must select a tag"]
      render :new
    elsif @band.update(band_params)
      @band.update_tags(params[:tag_ids])
      flash[:notice] = "#{@band.name} added successfully"
      redirect_to band_url(@band.id)
    else
      @tag_ids = params[:tag_ids]
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end


  private

  def band_params
    params.require(:band).permit(:name)
  end
end
