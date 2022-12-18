# frozen_string_literal: true

class Publication < ApplicationRecord
  has_many :reviews, dependent: :delete_all

  has_many :reserve_requests, dependent: :delete_all
  has_many :users, through: :reserve_requests

  has_one_attached :thumbnail

  validates :title, :synopsis, presence: true
  validates :title, length: { minimum: 2}
  validates :synopsis, length: { minimum: 2}
end
