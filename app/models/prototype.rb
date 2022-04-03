class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  #関連しているcommentsテーブルのレコードも同時にdestroyメソッドが実行され、一緒に削除
  has_one_attached :image
  # prototypeテーブルとActive Storageのテーブルで管理された画像ファイルのアソシエーションを記述
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end