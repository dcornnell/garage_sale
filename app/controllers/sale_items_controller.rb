class SaleItemsController < ApplicationController
#GET '/sale_items'
	def index
		@sale_items= SaleItem.all
	end
	#Get '/sale_items'
	def new 
		@new_item = SaleItem.new
	end
	#POST '/sale_items'
	def create
		@new_item = SaleItem.new(sale_item_params)
			if @new_item.save
				redirect_to sale_items_path
			end
	end
	# Get /sale_items/:id'
	def show
		@sale_item = SaleItem.find(params[:id])
	end

	#get /sale_items/:id/edit
	def edit
		@sale_item = SaleItem.find(params[:id])
	end
	#Patch/put "/sale_item/:id"
	def update
		@item = SaleItem.find(params[:id])
		if @item.update_attributes(sale_item_params)
			redirect_to "/sale_items"
		end
	end

	def destroy
		@sale_item = SaleItem.find(params[:id])
		@sale_item.delete
			redirect_to "/sale_items"
	end


	def change_sold_status
		@sale_item = SaleItem.find(params[:id])
		if @sale_item.sold 
			val = false
		else
			val = true
		end
		@sale_item.update_attributes(:sold => val)
		redirect_to sale_item_path
	end
	
	private

	def sale_item_params
		params.require(:sale_item).permit!
		# permit! will give all of em
	end
end



