class CreateTagsTutorialsJoin < ActiveRecord::Migration
  def up
    create_table :tags_tutorials, :id => false do |t|
      t.references :tag
      t.references :tutorial
    end
    add_index :tags_tutorials, %w(tag_id tutorial_id)
  end

  def down
    drop_table :tags_tutorials
  end
end
