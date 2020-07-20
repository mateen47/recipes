class ApplicationController < ActionController::Base

	helper_method :current_chef, :logged_in?

	def current_chef
		@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
	end

	def logged_in?
		!!current_chef
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end

	def require_same_user
		if current_chef != @recipe.chef and !current_chef.admin?
			flash[:danger] = "You can edit or delete your own recipes"
			redirect_to recipes_path
		end
	end

end
