class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_processing_of :avatar
  validate :avatar_size_validation

  has_many :subscriptions
  has_many :documents
  has_many :events, through: :subscriptions

  def getname()
    return self.surname+' '+self.name
  end

  def isplayer(id)
    if(id == 0)
      if(self.canrole == 'premiere' || self.canrole == 'academy' || self.canrole == 'm21' || self.canrole == 'm20' || self.canrole == 'm18' || self.canrole == 'm16' || self.canrole == 'm14')
        return true
      else
        return false
      end
    else
      user = User.find(id)
      if(user.canrole == 'premiere' || user.canrole == 'academy' || user.canrole == 'm21' || user.canrole == 'm20' || user.canrole == 'm18' || user.canrole == 'm16' || user.canrole == 'm14')
        return true
      else
        return false
      end
    end

  end

  def isadmin()
  if(self.canrole == 'admin' || self.canrole == 'staff' || self.canrole == 'medical')
    return true
  else
    return false
  end
  end

  def canviewmedical(playertobeviewedid)

    if( playertobeviewedid == self.id || self.canrole == 'medical' || self.canrole == 'admin' )
      return true
    else
      return false
    end

  end

  def getaddress()
    string = "";
    if(self.address1 != nil)
      string = string + self.address1
    end
    if(self.address2 != nil)
      string = string + " " +self.address2
    end
    if(self.zip != nil)
      string = string + '<br>' +self.zip
    end
    if(self.city != nil)
      string = string + ' ' + self.city
    end
    return string
  end

  def canviewplayer(playertobeviewedid)
    if(  ( (self.canrole == 'admin' || self.canrole == 'staff') && isplayer(playertobeviewedid) )  || (self.isplayer(0) && playertobeviewedid == self.id) )
      return true
    else
      return false
    end
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
