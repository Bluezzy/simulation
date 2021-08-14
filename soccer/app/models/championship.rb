class Championship < ApplicationRecord
  has_many :teams, dependent: :destroy
end
