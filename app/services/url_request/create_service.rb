# frozen_string_literal: true

class UrlRequest
  class CreateService < ApplicationService
    def call(url:)
      url_request = UrlRequest.create!(url: url)

      [nil, url_request: url_request]
    end
  end
end
