class MagicItemsController < ApplicationController
  before_action :set_magic_item, only:[:show, :update, :edit, :destroy]

  def index
    # @magic_items = render({json: MagicItem.all})
    @magic_items = MagicItem.all
  end

  def new
    @magic_item = MagicItem.new
  end

  def create
    @magic_item = MagicItem.new(magic_item_params)
    @magic_item.save
    redirect_to magic_item_path(@magic_item)
  end

  def show
  end

  def edit
  end

  def update
    @magic_item.update(magic_item_params)
    redirect_to magic_item_path(@magic_item)
  end

  def destroy
    @magic_item.destroy
    redirect_to magic_items_path
  end

  def search
    if params[:search].blank?
      redirect_to magic_items_path
    else
      @parameter = params[:search].downcase
      @results = index.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  private

  def magic_item_params
    params.require(:magic_item).permit(:name, :item_type, :description, :rarity, :attunement)
  end

  def set_magic_item
    @magic_item = MagicItem.find(params[:id])
  end

end
