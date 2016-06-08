class ModulesController < ApplicationController
	
	def index
		@modules = Modules.order(:name)
	end

	def new
		@module = Modules.new
	end

	def show
		@module = Modules.find(params[:id])
	end

	def edit
		@module = Modules.find(params[:id])
	end

	def create
		@module = Modules.new(params[:module])
		#falta o create
	end

	def update
		@module = Module.find(params[:id])
		@module.update_attributes(params[:module])
		@module = Module.all
	end

	def destroy
		@module = Module.find(params[:id])
		@module.destroy
		@module = Module.all
	end
end