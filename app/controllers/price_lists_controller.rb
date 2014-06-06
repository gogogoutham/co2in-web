class PriceListsController < AdminController
	def create
		@price_list = PriceList.new_from_raw_params(price_list_params)
		
		if @price_list.save
			redirect_to marketplace_admin_price_list_url(@price_list)
		else 
			render 'new'
		end
	end

	def destroy
		@price_list = PriceList.find(params[:id])
		@price_list.destroy

		redirect_to marketplace_admin_price_lists_path
	end

	def edit
		@price_list = PriceList.find(params[:id])
	end

	def index
		@price_lists = PriceList.all_reverse_chronological
	end

	def new
		@price_list = PriceList.new_from_template(PriceList.latest)		
	end

	def show
		@price_list = PriceList.find(params[:id])
	end

	def update
		@price_list = PriceList.find(params[:id])

		if @price_list.update(snack_params)
			redirect_to marketplace_admin_price_list_url(@price_list)
		else
			render 'edit'
		end
	end

	private
		def price_list_params
			params.require(:price_list).permit(:creationtime, snack_quotes_attributes: [:id, :include, :price, :deposit_address, :snack_id])
		end
end
