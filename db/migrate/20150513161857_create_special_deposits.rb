class CreateSpecialDeposits < ActiveRecord::Migration
  def change
    create_table :special_deposits do |t|
      t.string :from
      t.text :message
      t.string :value

      t.timestamps null: false
    end
  end
end
