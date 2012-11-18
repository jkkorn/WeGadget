class CreateTutorials < ActiveRecord::Migration
  def up
    create_table :tutorials do |t|

      t.references :category
      t.references :user
      t.string :title,         :null => false, :default => ""
      t.string :subtitle,      :null => true, :default => ""
      t.text   :description,   :null => false
      t.timestamps

    end
    add_index :tutorials, %w(category_id)
    add_index :tutorials, %w(user_id)
  end

  def down
    drop_table :tutorials
  end

end
