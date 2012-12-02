class CreateCategoriesTutorialsJoin < ActiveRecord::Migration
  def up
    create_table :categories_tutorials, :id => false do |t|
      t.references :category
      t.references :tutorial
    end
    add_index :categories_tutorials, %w(category_id tutorial_id)
  end

  def down
    drop_table :categories_tutorials
  end
end