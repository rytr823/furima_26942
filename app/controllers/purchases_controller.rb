class PurchasesController < ApplicationController
  def index
    @buyer = Purchase.find(params[:id])
  end
end
