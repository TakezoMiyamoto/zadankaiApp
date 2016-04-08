class Conference < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :opinions

  validates :title, :description, presence: true
end
