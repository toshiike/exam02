class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
