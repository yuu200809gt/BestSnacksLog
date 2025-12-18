class HomesController < ApplicationController
  def index
  @snacks = Snack.all.order(created_at: :desc).limit(2)
  end
end
