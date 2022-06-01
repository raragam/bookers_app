class ListsController < ApplicationController
  def new
  end

  def index
    @list = List.new
    @lists = List.all
  end

  def create

    @list = List.new(list_params)

    if @list.save
      flash[:notice] = "Book was successfully created."
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :index
    end

  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
    @lists = List.all
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/books'
  end

  private

  def list_params
    params.require(:list).permit(:title, :body)
  end

end