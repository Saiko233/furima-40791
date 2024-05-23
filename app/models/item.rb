class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true, unless: :was_attached?
  validates :name, presence: true
  validates :description, presence: true
  validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, presence: true
  validates :category_id, numericality: { other_than: 0}, presence: true
  validates :condition_id, numericality: { other_than: 0}, presence: true
  validates :shipping_fee_id, numericality: { other_than: 0}, presence: true
  validates :prefecture_id, numericality: { other_than: 0}, presence: true
  validates :shipping_day_id, numericality: { other_than: 0}, presence: true

  def was_attached?
    self.image.attached?
  end
end