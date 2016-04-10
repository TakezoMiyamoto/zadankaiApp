class ZadankaiController < ApplicationController
  def home
     # 直近のプロジェクト６件を取得
    @projects = Project.order(created_at: :desc).limit(6)
  end

  def about
  end
end
