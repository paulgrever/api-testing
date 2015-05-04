class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def create
    respond_with :api, :v1, Item.create(item_params)
  end

  private 

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
