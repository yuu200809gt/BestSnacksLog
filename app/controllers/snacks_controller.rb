class SnacksController < ApplicationController
  before_action :set_snack, only: [:show, :edit, :update, :destroy]

  def index
    @snacks = Snack.all
    best_snack = params[:best_snack]
    alcohols = params[:alcohol]
    keyword = params[:keyword]

    if params[:best_snack].present?
      @snacks = @snacks.where("food_types LIKE ?", "%#{best_snack}%")
    end

    if params[:alcohol].present?
      @snacks = @snacks.where("best_alcohol LIKE ?", "%#{alcohols}%")
    end

    if params[:keyword].present?
      @snacks = @snacks.where("name LIKE ? OR memo LIKE ? OR best_alcohol LIKE ? OR food_types LIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end

    if params[:best_snack].blank? && params[:alcohol].blank? && params[:keyword].blank?
      @snacks
    end
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
    params.require(:snack).permit(:name, :memo, :best_alcohol, :food_types, :food) # :foodは受け取る画像です。
  end

end
