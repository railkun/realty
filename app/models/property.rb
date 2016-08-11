class Property < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :images

  validates :title, presence: true
  validates :description  , presence: true
  validates :address, presence: true
  validates :area, presence: true
  validates :apartment, presence: true
  validates :price, presence: true
  validates :property_type, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :price_type, presence: true

  enum property_type: [ :ground_section, :apartment, :room, :cottage, :building ]
  enum price_type: [ :sale, :rent]

  scope :search, -> (params)  {
    search_price_from(params[:price_from])
      .search_price_to(params[:price_to])
      .search_property_type(params[:property_type])
      .search_price_type(params[:price_type])
  }
  scope :search_price_from, -> (p_from) { where('price >= ?', p_from) if p_from.present? }
  scope :search_price_to, -> (p_to) { where('price <= ?', p_to) if p_to.present? }
  scope :search_property_type, -> (pt) { where(property_type: pt) if pt.present? }
  scope :search_price_type, -> (prt) { where(price_type: prt) if prt.present? }
end
