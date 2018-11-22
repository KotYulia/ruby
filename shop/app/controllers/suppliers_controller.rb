class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new(product: @product)
  end

  def create
    @supplier = Supplier.create(supplier_params)
    if @supplier.save
      redirect_to product_path(@supplier.product.id)
    else
      render 'new'
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(supplier_params)
      redirect_to product_path(@supplier.product.id)
    else
      render 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to product_path(@supplier.product.id)
  end

  private
  def supplier_params
    params.require(:supplier).permit(:product_id,:title, :image)
  end
end
