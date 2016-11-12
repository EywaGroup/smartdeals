class InfoController < ApplicationController

  def index
  		@array1 = session[:array]
  end

end
