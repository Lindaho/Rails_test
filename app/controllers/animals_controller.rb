class AnimalsController < ApplicationController
	def index
		@animals = Animal.page(params[:page]).per(5)

	end

	def new
		@animal = Animal.new
	end

	def create
		@animal = Animal.new(animal_params)
		@animal.save

		redirect_to :action => :index
	end

	def show
		animal_data
	end

	def destroy
		@animal = animal_data
		@animal.destroy

		redirect_to :action => :index
	end

	def edit
		animal_data
	end

	def update
		@animal = animal_data
		@animal.update(animal_params)

		redirect_to :action => :show, :id => @animal
	end

	private

	def animal_params
		params.require(:animal).permit(:name,:sex,:desc)
	end

	def animal_data
		@animal = Animal.find(params[:id])
	end
end
