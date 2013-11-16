class BoardController < ApplicationController

  def index
  	redirect_to index_path if current_resource
  end
end