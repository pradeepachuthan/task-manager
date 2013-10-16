class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.column :name, :string, :limit => 255, :null => false
      t.column :email, :string, :limit => 255, :null => false
      t.column :message, :text, :null => false
      t.column :status_id, :integer, :default => 1
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end
  end
  def down
    drop_table :tickets
  end
end
