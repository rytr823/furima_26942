class PurchasesController < ApplicationController
  before_action :item
  before_action :soldout
  before_action :move_toppage

  def index
    redirect_to user_session_path unless user_signed_in?
  end
  
  private

  def move_toppage
    redirect_to root_path if current_user.id == @item.user_id
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def soldout
    @purchase = Purchase.find_by(params[:item_id])
    redirect_to root_path unless @purchase.nil?
  end
end


# http://localhost:3000/items/1/purchases