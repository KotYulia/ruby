class ProductsController < ApplicationController
  def new
    @product = Product.new(category: @category)
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to category_path(@product.category.id)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to category_path(@product.category.id)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(@product.category.id)
  end

  private
  def product_params
    params.require(:product).permit(:category_id,:title, :image)
  end
end
