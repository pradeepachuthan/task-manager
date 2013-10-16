class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.column :status, :string, :limit => 255
    end
  end
  def down
    drop_table :statuses
  end
end
