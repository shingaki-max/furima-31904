class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create, :edit, :update]
before_action :set_item, only: [:edit, :show, :update]
before_action :check_user, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

private 
  def item_params
    params.require(:item).permit(:item_name, :category_id, :price, :image, :description, :shipping_charge_id, :state_id, :prefecture_id, :send_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end
