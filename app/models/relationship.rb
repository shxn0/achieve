class Relationship < ActiveRecord::Base

  #Userモデルで外部キーとしてfollower_idを指定したため、従属先をfollowerと定義する（参照関係の名前が:followerのイメージ）
  #ルール通りの挙動だと従属先として定義したfollowerモデルを参照してしまうため参照先のモデル名を"User"と指定する
  belongs_to :follower, class_name: "User"

  #Userモデルで外部キーとしてfollowed_idを指定したため、従属先をfollowedと定義する（参照関係の名前が:followedのイメージ）
  #ルール通りの挙動だと従属先として定義したfollowedモデルを参照してしまうため参照先のモデル名を"User"と指定する
  belongs_to :followed, class_name: "User"
end
