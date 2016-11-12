class PizzasController < ApplicationController
helper_method :create_tranzaction
	before_action :find_pizza, only: [:show, :edit, :update, :destroy]

   class Tranzaction
	attr_accessor :name,:vendor_number,:price
  def initialize(name="", vendor_number="", price="")
     @name    = name
     @vendor_number   = vendor_number
     @price = price
  end
end

def create_tranzaction(name, vendor_number,price)
		@tranzaction = Tranzaction.new(name,vendor_number,price)
		@tranzaction
end


	def index
		@pizza = Pizza.all.order("created_at DESC")
	end

	def show
				@array = Array.new()
				@pizza.ingredients.each do |ingredient| 
				tranzaction = create_tranzaction(ingredient.name,ingredient.vendor_number,ingredient.price)
            @array.push(tranzaction)           
             end 
				session[:array] = @array
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
