# frozen_string_literal: true

class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
