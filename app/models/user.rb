class User < ApplicationRecord
  #has_many :contents, dependent: :destory
  has_many :contents

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
