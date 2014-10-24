class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followed_user, index: true

      t.timestamps
    end

    add_index :following_relationships, [:follower_id, :followed_user_id], unique: true, name: "follower_and_followed_user" 
  end
end
