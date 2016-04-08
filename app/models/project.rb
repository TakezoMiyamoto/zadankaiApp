class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  #relationships
  has_many :joining_relationships, class_name:  "Relationship",
                                    foreign_key: "joined_project_id",
                                    dependent:   :destroy
  has_many :joiner_users, through: :joining_relationships, source: :joiner_user

  mount_uploader :main_image, MainImageUploader
end
