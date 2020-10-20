# frozen_string_literal: true

class CreateUrlRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :url_requests do |t|
      t.references :url, null: false

      t.timestamps
    end
  end
end
