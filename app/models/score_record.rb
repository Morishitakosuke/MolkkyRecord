class ScoreRecord < ApplicationRecord
  belongs_to :record
  belongs_to :score
  with_options presence: true do
    validates :record_id
    validates :score_id
  end
end
