class OrderShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :management_id, :user_id, :item_id, :token
  
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true, format: {with: /\A[ぁ-んァ-ケ一-龥々]/, message: "is invalid."}
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\d{10}\z|\A\d{11}\z/, message: "is invalid." }
  validates :token, presence: true

  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, management_id: management.id)
  end
end