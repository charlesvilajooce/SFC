class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_processing_of :avatar
  validate :avatar_size_validation

  has_many :subscriptions
  has_many :events, through: :subscriptions

  def getname()
    return self.surname+' '+self.name
  end

  # private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

  ROLES = %i[admin premiere academy staff]

  # def roles=(roles)
  #   roles = [*roles].map { |r| r.to_sym }
  #   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  # end
  #
  # def roles
  #   ROLES.reject do |r|
  #     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  #   end
  # end

  def has_role?(role)
    roles.include?(role)
  end

  def getnicedate(value)
    if(value != nil)
      tmp = value.to_time.to_i
      tmp2 = Time.at(tmp).strftime '%d.%m.%Y'
      return tmp2
    else
      return nil
    end
  end

end
