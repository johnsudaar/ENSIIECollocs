class Colloc < ActiveRecord::Base
  validates :titre, presence: true
  validates :adresse, presence: true
  validates :size, :numericality => { :greater_than => 0}, presence: true
  validates :chambres, :numericality => { :greater_than => 0}, presence: true
  validates :max_people, :numericality => { :grater_than => 1}, presence: true
  validates :price, :numericality => {:greater_than_or_equal_to =>0 }, presence: true
  has_many :users
  geocoded_by :adresse
  after_validation :geocode
  has_many :pictures, dependent: :destroy

  def admin
    return self.users.where({:c_admin => true})[0]
  end

  def full
    return self.users.where({:accepted => true}).length >= self.max_people
  end

  def destroy
    self.users.each do |u|
      u.colloc = nil
      u.accepted = false
      u.c_admin = false
      u.save
    end
    super
  end
end
