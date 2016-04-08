class Relationship < ActiveRecord::Base
  belongs_to :joiner_user
  belongs_to :joined_project
end
