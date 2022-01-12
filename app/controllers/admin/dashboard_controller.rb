class Admin::DashboardController < Admin::BaseController
  def show
    # query db for # of categories and products
    @categories_count = Category.count
    @products_count = Product.count
  end
end
