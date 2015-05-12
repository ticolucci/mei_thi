class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :from
      t.string :email

      t.timestamps null: false
    end
  end
end
