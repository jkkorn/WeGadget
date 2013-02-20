class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|

      t.string     :name,         :null => false, :default => ""
      t.string     :link,         :null => false, :default => ""

    end
  end

  def down
    drop_table :events
  end

end