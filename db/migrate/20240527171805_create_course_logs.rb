# frozen_string_literal: true

class CreateCourseLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :course_logs do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :user_id, default: 1
      t.integer :state, default: 0
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
