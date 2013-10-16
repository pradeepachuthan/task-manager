class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.column :task_id, :integer
      t.column :token, :string, :limit => 255, :null => false
    end
  end
  def down
    drop_table :tokens
  end
end
