class Admin::DashboardController < ApplicationController
  def show
    # query db for # of categories and products
    @categories_count = Category.count
    @products_count = Product.count
  end
end
