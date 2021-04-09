class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

private 
  
  
#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#  end
  def item_params
    params.require(:item).permit(:item_name, :category_id, :price, :image, :description, :shipping_charge_id, :state_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end
end
