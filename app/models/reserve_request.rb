# frozen_string_literal: true

class ReserveRequest < ApplicationRecord
  belongs_to :user
  belongs_to :publication
end
