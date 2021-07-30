class ListsController < ApplicationController
  before_action :set_find_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_params(@list.id)
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

  def set_find_list
    @list = List.find(params[:id])
  end
end
