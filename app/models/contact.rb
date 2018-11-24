class Contact< ApplicationRecord
  include ActiveModel::Model

  attr_accessor :name, :tel, :email, :content
  
	validates :name, presence: true
	validates :tel, presence: false, numericality: true
	validates :email, presence: true
end