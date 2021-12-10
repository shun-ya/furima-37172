class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :burden
  belongs_to :status
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :user
  # has_one :management
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :ship_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :cost, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  validates :image, presence:true
end
