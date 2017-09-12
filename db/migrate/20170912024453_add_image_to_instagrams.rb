class AddImageToInstagrams < ActiveRecord::Migration
  def change
    add_column :instagrams, :image, :string
  end
end
