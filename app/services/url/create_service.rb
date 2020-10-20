# frozen_string_literal: true

class Url
  class CreateService < ApplicationService
    def call(params)
      sanitized_url = params[:sanitized_url]

      return [:unprocessable_entity, 'Url is not valid'] unless sanitized_url.is_a?(String)
      return [:unprocessable_entity, 'Url is blank'] if sanitized_url.blank?

      new_url = Url.find_or_initialize_by(url: sanitized_url)
      if new_url.new_record?
        new_url.slug = generate_slug
        new_url.save!
      end

      UrlRequest::CreateService.call(url: new_url)

      [nil, url: new_url]
    end

    private

    def generate_slug
      SecureRandom.hex(8)
    end
  end
end
