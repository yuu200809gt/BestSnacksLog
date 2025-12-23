class HomesController < ApplicationController
  def index
  @snacks = Snack.all.order(created_at: :desc).limit(8)
  end
end
