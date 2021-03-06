class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to_id
      t.integer :from_id
      t.text :content

      t.timestamps
    end

    add_index :messages, :to_id
    add_index :messages, :from_id
  end
end
