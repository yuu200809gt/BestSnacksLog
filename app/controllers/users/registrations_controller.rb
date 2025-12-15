class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user
  before_action :ensure_guest_user, only: [:edit, :update]

  def show; end

  def edit; end

  def update
    sanitized_params = registrations_params.dup

    # パスワードが空なら更新対象から外す（空文字で上書き事故を防ぐ）
    if sanitized_params[:password].blank?
      sanitized_params.delete(:password)
    end
  
    if current_user.update(sanitized_params)
      # パスワードを変えたときだけセッション更新が必要
      if sanitized_params[:password].present?
        bypass_sign_in(current_user)
      end
  
      redirect_to root_path, notice: "プロフィール情報が変更されました。"
    else
      flash.now[:alert] = "プロフィール情報の変更に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end


  def ensure_guest_user
    if current_user&.email == "guestr3@example.com"
      redirect_to root_path, alert: "ゲストユーザーのため編集できません。"
    end
  end

  def registrations_params
    params.require(:user).permit(:email, :password, :avatar) # avatarはアイコン画像です。
  end
end
