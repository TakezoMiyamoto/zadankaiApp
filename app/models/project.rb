class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :main_image, MainImageUploader
end
