class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :days_delivery
  has_one_attached :image
end
