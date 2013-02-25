class CreateEmailCadastrados < ActiveRecord::Migration
  def change
    create_table :email_cadastrados do |t|

      t.string :email, :null => false, :default => ""
      t.string :tipo,  :null => false, :default => ""

    end
  end
end
