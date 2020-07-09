class PurchasesController < ApplicationController
  @buyer = Purchase.find(params[:id])
end
