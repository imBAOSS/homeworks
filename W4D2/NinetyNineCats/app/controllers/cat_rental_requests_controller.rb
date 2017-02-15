class CatRentalRequestsController < ApplicationController
  def index

  end

  def show

  end

  def new
    @cats = Cat.all
    render :new
  end

  def create

  end
end
