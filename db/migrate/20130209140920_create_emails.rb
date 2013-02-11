class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|

      t.string :email, :null => false, :default => ""
    end
  end
end