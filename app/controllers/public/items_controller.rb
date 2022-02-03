class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :page, :is_active)
  end

end
