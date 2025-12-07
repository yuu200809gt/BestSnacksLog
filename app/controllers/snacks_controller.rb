class SnacksController < ApplicationController
  before_action :set_snack, only: [:show, :edit, :update, :destroy]

  def index
    @snacks = Snack.all
  end

  def new
    @snack = Snack.new
  end

  def create
    @snack = current_user.snacks.build(snack_params)
    if @snack.save
      redirect_to snacks_path, notice: "おつまみを登録しました"
    else
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @snack.update(snack_params)
      @snack.save
      redirect_to :snacks
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @snack.destroy
    flash[:notice] = "おつまみを削除しました"
    redirect_to snacks_path
  end

  private

  def set_snack
    @snack = Snack.find(params[:id])
  end

  def snack_params
    params.require(:snack).permit(:name, :image, :memo, :best_alcohol, :food_types)
  end

end
