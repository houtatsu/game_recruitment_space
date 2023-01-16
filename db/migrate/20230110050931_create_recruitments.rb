class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.integer :customer_id, null: false
      t.integer :style_id, null: false
      t.integer :play_time_id, null: false
      t.text :recruitment_letter, null: false

      t.timestamps
    end
  end
end
