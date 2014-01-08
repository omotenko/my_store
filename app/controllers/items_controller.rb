class ItemsController < ApplicationController

	before_filter :find_item, only: [:show,:edit,:update,:destroy,:upvote]
	before_filter :check_if_admin, only: [:new,:edit,:create,:update,:destroy]

	def index
		@items = Item.all
	end
	
	#CRUD action
	#/items/1  GET показывает конкретный товар из БД
	def show
		unless @item
			render text:"Page not found",status:404
		end
	end
	
	#/items/new GET делает новую форму для создания товара
	def new
		@item = Item.new
	end
	
	#/items/1/edit GET редактирует конкретный товар
	def edit
	end
	
	#/items POST создает запись в БД
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end
	
	#/items/1 PUT обновляет запись в БД
	def update
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
			flash[:success] = "The form is completed successfully"
		else
			flash[:error] = "You made a mistake!Please repeat the correct input"
			render "edit"
		end
	end
	
	#/items/1 DELETE удаляет запись из БД
	def destroy
		@item.destroy
		redirect_to action:"index"
	end
	
	def upvote
		@item.increment!(:votes_count)
		redirect_to action: "index"
	end
	
	def expensive
		@items = Item.where("price > 200")
		render "index"
	end
	
	private
	
		def find_item
			@item = Item.where(id: params[:id]).first
		   render_404 unless @item
		end
		
end
