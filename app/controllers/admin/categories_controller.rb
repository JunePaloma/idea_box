class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    redirect_to admin_categories_path
  end

private
  def category_params
      params.require(:category).permit(:title)
  end
end
