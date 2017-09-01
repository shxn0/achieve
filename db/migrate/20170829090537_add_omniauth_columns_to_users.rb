class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, nill: false, default:""
    add_column :users, :provider, :string, nill: false, default:""
    add_column :users, :image_url, :string

    add_index :users, [:uid, :provider], unique:true
  end
end
