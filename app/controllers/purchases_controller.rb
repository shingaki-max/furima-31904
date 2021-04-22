class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @order = Order.new
    create_item
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(purchase_params)
    create_item
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def create_item
    @item = Item.find(params[:item_id])
  end

  

end
