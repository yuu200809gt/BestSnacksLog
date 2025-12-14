class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user
  before_action :ensure_guest_user, only: [:edit, :update]

  def show; end

  def edit; end

  def update
    if current_user.update(registrations_params)
      bypass_sign_in(@user)
      redirect_to root_path, notice: "プロフィール情報が変更されました。"
    else
      flash.now[:alert] = "プロフィール情報の変更に失敗しました。"
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end


  def ensure_guest_user
    if resource.email == "guestr3@example.com"
      redirect_to root_path, alert: "ゲストユーザーのため編集できません。"
    end
  end

  def registrations_params
    params.require(:user).permit(:email, :password, :avatar) # avatarはアイコン画像です。
  end
end
