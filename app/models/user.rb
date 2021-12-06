class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, {presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}}
  validates :first_name, {presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}}
  validates :family_name_kana, {presence: true, format: {with: /\A[ァ-ヶー－]+\z/}}
  validates :first_name_kana, {presence: true, format: {with: /\A[ァ-ヶー－]+\z/}}
  validates :birthday, presence: true
  validates :password, {length: { minimum: 6 }, format: {with: /\A[a-zA-Z0-9]+\z/}}
  validates :email, {uniqueness: true, format: {with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}}
end
