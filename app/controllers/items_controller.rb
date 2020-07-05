class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end
end
