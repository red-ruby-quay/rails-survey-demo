class Survey < ApplicationRecord
  has_many :responses, dependent: :destroy

  validates :title, presence: true, length: { maximum: 120 }

  def average_score
    return 0.0 if responses.empty?

    responses.average(:score).to_f.round(1)
  end
end
