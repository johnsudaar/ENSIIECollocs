class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates :name, presence: true
  validates :surname, presence: true
  validates :phone, presence:true
  validates :promo, :numericality => {:less_than_or_equal_to =>Time.now.year + 3 }, presence: true


  belongs_to :colloc

  def can_admin colloc
    if self.colloc.id == colloc.id and self.c_admin
      return true
    else
      return false
    end
  end

  def destroy
    if self.c_admin
      self.colloc.destroy
    end
    super
  end

  def add_colloc colloc
    self.colloc = colloc
    self.c_admin = true
    self.accepted = true
    self.save
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end
end
