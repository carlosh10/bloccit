class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def create
  end

  def new
    @summary = Summary.new
  end

  
  def show
    @summary = Summary.find(params[:id])
  end
end
