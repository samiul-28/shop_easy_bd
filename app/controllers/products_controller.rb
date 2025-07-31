class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:q]
    @category_id = params[:category_id]

    @products = Product.all

    # Filter by search
    if @query.present?
      @products = @products.where("name_en ILIKE :search OR name_bn ILIKE :search", search: "%#{@query}%")
    end

    # Filter by category
    if @category_id.present?
      @products = @products.where(category_id: @category_id)
    end

  end

  def show; end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      redirect_to @product, notice: t('messages.product_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to @product, notice: t('messages.product_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_path, notice: t('messages.product_deleted')
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name_en, :name_bn, :description_en, :description_bn, :price, :stock, :category_id, :image)
  end
end
