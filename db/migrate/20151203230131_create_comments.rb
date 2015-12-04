class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :commentalbe, polymorphic: true, index: true
      t.text :body

      t.timestamps
    end
  end
end
