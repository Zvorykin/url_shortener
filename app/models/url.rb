# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :url_requests
end
