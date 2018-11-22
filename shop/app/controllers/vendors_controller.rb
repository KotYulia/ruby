class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new(supplier: @supplier)
  end

  def create
    @vendor = Vendor.create(vendor_params)
    if @vendor.save
      redirect_to supplier_path(@vendor.supplier.id)
    else
      render 'new'
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update_attributes(vendor_params)
      redirect_to supplier_path(@vendor.supplier.id)
    else
      render 'edit'
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to supplier_path(@vendor.supplier.id)
  end

  private
  def vendor_params
    params.require(:vendor).permit(:supplier_id,:title, :image)
  end
end
