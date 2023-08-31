# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :tag_id
      t.string :page_content

      t.timestamps
    end
  end
end
