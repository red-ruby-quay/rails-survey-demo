class Response < ApplicationRecord
  belongs_to :survey

  validates :respondent_name, presence: true, length: { maximum: 80 }
  validates :score,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 5
            }
end
