class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.column :name, :string, :limit => 255
      t.column :email, :string, :limit => 255
      t.column :message, :text, :null => false
      t.column :ticket_id, :integer
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end
  end
  def down
    drop_table :responses
  end
end
