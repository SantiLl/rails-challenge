class Cryptocurrency < ApplicationRecord
  # Associations
  has_many :favorite_cryptocurrencies, dependent: :destroy
  has_many :users, through: :favorite_cryptocurrencies, source: :user

  # Enum
  enum pair: { USD: 0 }

  # Validations
  validates :name, :symbol, :pair, :price, :market_cap, :total_volume, presence: true
  validates :price, :market_cap, :total_volume, :favorites_count, numericality: true
  validates :name, :symbol, uniqueness: true

  # Instance Methods

  def increment_favorites_count!
    self.favorites_count += 1
  end

  def decrement_favorites_count!
    self.favorites_count -= 1
  end
end
