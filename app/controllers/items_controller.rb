class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.order('created_at DESC')
  end

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

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :image,
      :introduction,
      :price,
      :sales_commission,
      :sales_profit,
      :category_id,
      :status_id,
      :postage_pay_id,
      :shipping_area_id,
      :days_until_shipping_id,
      :user_id
    ).merge(user_id: current_user.id)
  end
end
