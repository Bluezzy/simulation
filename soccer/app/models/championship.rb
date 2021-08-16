class Championship < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_one :calendar
  has_many :matches

  def generate_calendar
    self.teams
  end
end
