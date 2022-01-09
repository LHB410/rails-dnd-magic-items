class MagicItemsController < ApplicationController
  before_action :set_magic_item, only:[show, update, edit, destroy]

  def index
    # @magic_items = render({json: MagicItem.all}) this displays the json file version
    @magic_items = MagicItem.all
  end

  def create
    @magic_item = MagicItem.new(magic_item_params)
    @magic_item.save
    redirect_to magic_item_path(@magic_item)
  end

  def new
    @magic_item = MagicItem.new
  end

  def show
    @magic_item = MagicItem.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

  def magic_item_params
    params.require(:magic_item).permit(:name, :type, :description, :rarity, :attunement)
  end

  def set_magic_item
    @magic_item = MagicItem.find(params[:id])
  end

end
