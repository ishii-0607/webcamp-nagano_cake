class Admin::OrdesController < ApplicationController

  def show
    @orde = Orde.find(params[:id])
  end

end
