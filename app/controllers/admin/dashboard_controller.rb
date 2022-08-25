class Admin::DashboardController < ApplicationController
  def show
    @count = Product.count
    @category_count = Category.count
  end
end
