class ChefsController < ApplicationController
	before_action :set_chef, only: [:show]


	def new
		@chef = Chef.new
	end

	def show
		
	end

	def create
		@chef = Chef.new(chef_params)
		
		if @chef.save
			flash[:success] = "Welcome #{@chef.chefname} MyRecipe app"
			redirect_to chef_path(@chef)
		else
			redirect_to 'new'
		end
	end


	private

		def set_chef
			@chef = Chef.find(params[:id])
		end
		def chef_params
			params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
		end

end
