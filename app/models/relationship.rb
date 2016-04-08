class Relationship < ActiveRecord::Base
  belongs_to :joiner_user, class_name: "User"
  belongs_to :joined_project, class_name: "Project"

  
end
