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

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in?
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    else
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

private 
  def item_params
    params.require(:item).permit(:item_name, :category_id, :price, :image, :description, :shipping_charge_id, :state_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end
end
