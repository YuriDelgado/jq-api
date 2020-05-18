class ProductsController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    @products = Product.all
  end
end
