class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_imgs.build
      render :new
    end
  end
  

  
  
  

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :price, :status_id, :delivery_id, :days_delivery_id, :category_id, :burden_id).merge(user_id: current_user.id)
  end
end
