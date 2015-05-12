class Colloc < ActiveRecord::Base
  validates :titre, presence: true
  validates :adresse, presence: true
  validates :size, :numericality => { :greater_than => 0}, presence: true
  validates :chambres, :numericality => { :greater_than => 0}, presence: true
  validates :max_people, :numericality => { :grater_than => 1}, presence: true
  validates :price, :numericality => {:greater_than_or_equal_to =>0 }, presence: true
  validates :user_id, presence:true
  validates_uniqueness_of :user_id
  belongs_to :user
  geocoded_by :adresse
  after_validation :geocode
  has_many :pictures, dependent: :destroy

  def belongs_to user
    if self.user == user
      return true
    else
      return false
    end
  end
end
