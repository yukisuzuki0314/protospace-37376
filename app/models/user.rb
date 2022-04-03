class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :name,:profile, :occupation, :position, presence: true   #追加カラムのバリデーション

   has_many :prototypes
   has_many :comments
end
