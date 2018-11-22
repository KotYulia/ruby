class CategoriesController < ApplicationController
  def new
    @category = Category.new(store: @store)
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to store_path(@category.store.id)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to store_path(@category.store.id)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to store_path(@category.store.id)
  end

  private
  def category_params
    params.require(:category).permit(:store_id,:title, :image)
  end

end
