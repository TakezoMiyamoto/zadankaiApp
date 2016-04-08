class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :projects
  has_many :comments
  has_many :conferences
  has_many :opinions

  #relationships
  has_many :joining_relationships, class_name:  "Relationship",
                                     foreign_key: "joiner_user_id",
                                     dependent:   :destroy
  has_many :joined_projects, through: :joining_relationships, source: :joined_project

  mount_uploader :avatar, AvatarUploader


  # relationships methods
  # プロジェクトにジョインする
  def join(project)
    joining_relationships.find_or_create_by(joined_project_id: project.id)
  end

  # ジョインしているプロジェクトをアンジョインする
  def unjoin(project)
    joining_relationship = joining_relationships.find_by(joined_project_id: project.id)
    joining_relationship.destroy if joining_relationship
  end

  # あるプロジェクトにジョインしているかどうか？
  def joining?(project)
    joined_projects.include?(project)
  end

  # facebook oath
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        username: auth.info.name,
        email: auth.info.email,
        remote_avatar: auth.info.image,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
end
