class PizzasController < ApplicationController
before_action :find_pizza, only: [:show, :edit, :update, :destroy]
	def index
		@pizza = Pizza.all.order("created_at DESC")
	end

	def show

	end

	def new
		@pizza = Pizza.new
	end

	def create
		@pizza = Pizza.new(pizza_params)

		if @pizza.save
			redirect_to @pizza, notice: "Successfully created new pizza"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pizza.update(pizza_params)
			redirect_to @pizza
		else
			render 'edit'
		end
	end

	def destroy
		@pizza.destroy
		redirect_to root_path, notice: "Successfully deleted pizza"
	end

private

	def pizza_params
		params.require(:pizza).permit(:title,:description,:image,ingredients_attributes: [:id,:price,:vendor_number, :name, :_destroy])
		
	end
	def find_pizza
		@pizza = Pizza.find(params[:id])
	end

end
