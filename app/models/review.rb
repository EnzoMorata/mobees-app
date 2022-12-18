# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, lower_than_or_equal_to: 5}
end
