class PurchasesController < ApplicationController
  before_action :find_item
  before_action :soldout
  before_action :move_toppage

  def index
    @detail = CardAddress.new
    redirect_to user_session_path unless user_signed_in?
  end

  def create
    @detail = CardAddress.new(purchase_params)
    if @detail.valid?
       @detail.save
       payjp
        purchase = Purchase.create(
          item_id: params[:item_id],
          user_id: current_user.id
        )
        redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_toppage
    redirect_to root_path if current_user.id == @item.user_id
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def soldout
    @purchase = Purchase.find_by(item_id: params[:item_id])
    redirect_to root_path unless @purchase.nil?
  end

  def purchase_params
    params.require(:card_address)
          .permit(:card_token,
                  :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id)
  end

  def payjp
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:card_address][:card_token],
      currency: 'jpy'
    )
  end
end
