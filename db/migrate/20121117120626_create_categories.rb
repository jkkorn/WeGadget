class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|

      t.references :category
      t.string  :name,        :null => false, :default => ""
      t.timestamps

    end
    add_index :categories, %w(category_id)
  end

  def down
    drop_table :categories
  end
end
