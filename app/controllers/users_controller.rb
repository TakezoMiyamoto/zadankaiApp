class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_user, only:[:show, :edit, :update, :joiner]
  before_action :matched_user, only:[:edit, :update]

  def index
    @users = User.all
  end

  def show
    @userName = @user.username
    # 自分のプロジェクト一覧
    @projects = @user.projects.group('projects.id')
    @projectsCount = @projects.count
    # 参加中のプロジェクト一覧
    @joinProjects = @user.joined_projects.group('projects.id')
  end

  def edit
    @prifectures = ["選択してください","北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]

    @genders = ["選択してください","男","女"]

  end

  def update
      if @user.errors[:base].empty? and @user.update(edit_user_params)
      sign_in(@user, :bypass => true)
      flash[:success] = "プロフィールは更新されました"
      redirect_to @user
    else
      flash[:danger] = "プロフィールの更新に失敗しました"
      redirect_to user_path(current_user.id)
    end
  end


  private

  def edit_user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :remote_avatar, :place, :birth, :gender, :introduce)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def matched_user

    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

end

