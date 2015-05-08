class Colloc < ActiveRecord::Base
  belongs_to :user
  validates :titre, presence: true
  validates :adresse, presence: true
  validates :size, :numericality => { :greater_than => 0}, presence: true
  validates :chambres, :numericality => { :greater_than => 0}, presence: true
  validates :max_people, :numericality => { :grater_than => 1}, presence: true
  validates :price, :numericality => {:greater_than_or_equal_to =>0 }, presence: true
  validates_uniqueness_of :user_id
  geocoded_by :adresse 
  after_validation :geocode
end
