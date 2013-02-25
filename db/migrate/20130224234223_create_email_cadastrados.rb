class CreateEmailCadastrados < ActiveRecord::Migration
  def change
    create_table :email_cadastrados do |t|

      t.string :email, :null => false, :default => ""

    end
  end
end
