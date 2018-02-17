class CategoriesController < ApplicationController
  before_action :is_authenticated?, only: [:index]
  
  def index
    @categories = Category.all
  end
end
