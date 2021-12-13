class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :contributor_confirmation, only: [:edit]

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end
 end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :burden_id, :prefecture_id, :ship_day_id, :cost).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to new_user_session_path unless user_signed_in?
  end



