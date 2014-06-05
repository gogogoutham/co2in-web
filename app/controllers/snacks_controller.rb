class SnacksController < AdminController
	def create
		@snack = Snack.new(snack_params)

		if @snack.save
			redirect_to @snack
		else 
			render 'new'
		end
	end

	def destroy
		@snack = Snack.find(params[:id])
		@snack.destroy

		redirect_to marketplace_admin_snacks_path
	end

	def edit
		@snack = Snack.find(params[:id])
	end

	def index
		@snacks = Snack.all.order(:name)
	end

	def new
		@snack = Snack.new
	end

	def show
		@snack = Snack.find(params[:id])
	end

	def update
		@snack = Snack.find(params[:id])

		if @snack.update(snack_params)
			redirect_to @snack
		else
			render 'edit'
		end
	end

	private
		def snack_params
			params.require(:snack).permit(:name, :description)
		end
end
