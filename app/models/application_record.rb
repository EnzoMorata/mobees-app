# frozen_string_literal: true

# Defines the base class ApplicationRecord for models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
