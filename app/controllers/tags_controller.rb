class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render :index
  end

  def new
    @tag = Tag.new
    render :new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_url
    else
      flash.now[:errors] = @tag.errors.full_messages
      render :new
    end
  end

  # def show
  #   @tag = Tag.find(params[:id])
  #   render :show
  # end

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_url
    else
      flash.now[:errors] = @tag.errors.full_messages
      render :edit
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to tags_url
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
