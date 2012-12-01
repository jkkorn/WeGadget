class CreateClassifications < ActiveRecord::Migration
  def up
    create_table :classifications do |t|

      t.string  :name,        :null => false, :default => ""
      t.timestamps

    end
  end

  def down
    drop_table :classifications
  end
end