class Notification < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :visitor, foreign_key: "visitor_id", class_name: "User", optional: true
  belongs_to :visited, foreign_key: "visited_id", class_name: "User", optional: true
end
