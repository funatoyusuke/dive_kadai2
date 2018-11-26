class Blog < ApplicationRecord
    validates :title,:content,presence: true, length: { in: 1..140 }
    #validates :image, presence: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user
    
    mount_uploader :image, ImageUploader
end