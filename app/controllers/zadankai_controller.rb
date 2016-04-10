class ZadankaiController < ApplicationController
  def home
     # 直近のプロジェクト６件を取得
    @projects = Project.order(created_at: :desc).limit(6)
    @title = "Home"
  end

  def about
    @title = "Zadankaiとは？"
  end

  def readyfor
    @title = "プロジェクトをはじめる"
  end
end
