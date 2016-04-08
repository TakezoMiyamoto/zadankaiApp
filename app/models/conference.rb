class Conference < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :title, :description, presence: true
end
