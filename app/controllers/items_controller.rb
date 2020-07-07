class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
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
      :days_until_shipping_id
    )
  end
end
