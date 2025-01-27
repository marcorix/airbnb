class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
