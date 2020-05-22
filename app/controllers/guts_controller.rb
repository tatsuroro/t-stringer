# frozen_string_literal: true

class GutsController < ApplicationController
  def index
    @guts = Gut.all
  end

  def show
    @gut = Gut.find(params[:id])
  end

  def new
    @gut = Gut.new
  end

  def edit
    @gut = Gut.find(params[:id])
  end

  def create
    @gut = Gut.new(gut_params)

    if @gut.save
      redirect_to @gut
    else
      render 'new'
    end
  end

  def update
    @gut = Gut.find(params[:id])

    if @gut.update(gut_params)
      redirect_to @gut
    else
      render 'edit'
    end
  end

  def destroy
    @gut = Gut.find(params[:id])
    @gut.destroy

    redirect_to guts_path
  end

  private

  def gut_params
    params.require(:gut).permit(:name, :description)
  end
end
