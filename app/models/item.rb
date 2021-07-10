class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :days_delivery
  has_one_attached :image

  validates :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :image, :price, :product_name, presence: true
end
