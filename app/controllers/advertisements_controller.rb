class AdvertisementsController < ApplicationController
  def index
     @advertc = Advertisement.all
  end

  def show
    @advert = Advertisement.find(params[:id])
  end

  def new
  end

  def edit
  end
end
