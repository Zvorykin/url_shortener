# frozen_string_literal: true

class UrlsController < ApplicationController
  URL_REGEXP = %r{(https?://)|(www\.)}.freeze

  def create
    status, payload = Url::CreateService.call(sanitized_url: sanitized_url)

    if status.present?
      render json: { error: payload }, status: status
    else
      render json: { slug: payload[:url].slug }
    end
  end

  def show
    UrlRequest.create!(url: url_by_slug_param)

    render json: { slug: url_by_slug_param.slug }
  end

  def stats
    requests_count = url_by_slug_param.url_requests.count

    render json: { requests: { count: requests_count } }
  end

  private

  def url_param
    params.require(:url)
  end

  def sanitized_url
    @sanitized_url ||= url_param.strip.gsub(URL_REGEXP, '')
  end

  def url_by_slug_param
    @url_by_slug_param ||= Url.find_by!(slug: params[:slug] || params['url_slug'])
  end
end
