class Api::V1::Merchants::FindController < ApplicationController
  respond_to :json

  def show
    # Merchant.where("NAME ilike ?", params[:name]).first
    respond_with Merchant.find_by(merchant_params)
  end

  def index
    respond_with Merchant.where(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
