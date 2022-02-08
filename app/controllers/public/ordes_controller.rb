class Public::OrdesController < ApplicationController

  def index
    @ordes = Orde.all
  end

  def show
    @orde = Orde.find(params[:id])
  end

  def new
    @orde = Orde.new
    @customer = current_customer

  end

  def create
    @orde = Orde.new(orde_params)
    @sum = 0
    @orde.shipping_cost = 800
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @orders_detail = @orde.orders_details.new
        @orders_detail.item_id = cart_item.item.id
        @orders_detail.orde_id = @orde.id
        @orders_detail.included_price = cart_item.item.with_tax_price
        @orders_detail.amount = cart_item.amount
        @sum += @orders_detail.included_price * @orders_detail.amount
        @orders_detail.save
      end
    @orde.total_payment = @sum + @orde.shipping_cost
    @orde.save
    current_customer.cart_items.destroy_all
    redirect_to ordes_thanks_path
  end

  def confirm
    @orde = Orde.new(orde_params)
    @orde.shipping_cost = 800
    @cart_items = current_customer.cart_items
    if params[:orde][:address_method] == "address"
      @orde.postal_code = current_customer.postal_code
      @orde.address = current_customer.address
      @orde.name = current_customer.first_name + current_customer.last_name
    elsif params[:orde][:address_method] == "new_address"
      @orde.name = params[:orde][:name]
      @orde.address = params[:orde][:address]
      @orde.postal_code = params[:orde][:postal_code]
    end
  end

  def thanks
  end

  private

  def orde_params
    params.require(:orde).permit(:payment, :postal_code, :address, :name)
  end

end
