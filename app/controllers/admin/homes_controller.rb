class Admin::HomesController < ApplicationController

  def top
    @ordes = Orde.page(params[:page]).reverse_order.per(10)
  end

end
