class IllustsController < ApplicationController
  def index
    render json: { message: "index" }
  end

  def create
    render json: { message: "create" }
  end
end
