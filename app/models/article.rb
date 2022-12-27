class Article < ApplicationRecord	
  attr_accessor :full_data
  has_one_attached :cover_photo

	has_many :comments, dependent: :destroy, inverse_of: :article
  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: lambda {|attributes| attributes['commenter'].blank?}
  has_many :formtests
	validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 } 
  
  validates :terms_of_service, acceptance: { accept: ['true','accepted'] }
end
