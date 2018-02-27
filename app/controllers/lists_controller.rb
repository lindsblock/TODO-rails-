class ListsController < ApplicationController
  #GET
  def index
    @lists = List.all
  end

  #GET
  def show
    @list = List.find(params[:id])
  end

  #GET
  def new
    @list = List.new
  end

  #GET
	def edit
    @list = List.find(params[:id])
	end

  #put
	def update
	  @list = List.find(params[:id])
    if @list.update(lists_params)
	    redirect_to lists_path
	  else
	    render :edit
	  end
	end

  #POST
	def create
    @list = List.new(lists_params)

	  if @list.save
	    redirect_to lists_path
	  else
	    render :new
	  end
	end


	private

	  def lists_params
      params.require(:list).permit(:title, :author, :body)
	  end

end
