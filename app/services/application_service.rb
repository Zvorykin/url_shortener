# frozen_string_literal: true

class ApplicationService
  attr_reader :result

  def self.call(params)
    new.call(params)
  end
end
