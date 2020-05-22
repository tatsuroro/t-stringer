# frozen_string_literal: true

class Gut < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 4 }
end
