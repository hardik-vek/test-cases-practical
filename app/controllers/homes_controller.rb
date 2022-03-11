# frozen_string_literal: true
class HomesController < ApplicationController
  def index
    @products = Product.all
    if user_signed_in? && current_user.role == "Admin"
      render :layout => "admin"
    elsif user_signed_in? && current_user.role == "Merchant"
      render :layout => "merchant"
    else
    end
  end
end
