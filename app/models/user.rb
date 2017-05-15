class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_processing_of :avatar
  validate :avatar_size_validation
#ts


  has_many :subscriptions
  has_many :injuries
  has_many :avatars
  has_many :relationship1, :class_name => 'Relationship', :foreign_key => 'user_one_id'
  has_many :relationship2, :class_name => 'Relationship', :foreign_key => 'user_two_id'

  has_many :matchevent1users
  has_many :matchevent2users1, :class_name => 'Matchevent2user', :foreign_key => 'user_one_id'
  has_many :matchevent2users2, :class_name => 'Matchevent2user', :foreign_key => 'user_two_id'
  has_many :matchlinks

  has_many :documents
  has_many :events, through: :subscriptions

  def getname()
    return self.surname+' '+self.name
  end

  def getbrs(string)
    return string.gsub(/\n/, '<br>')
  end

  def getplayers()
    players = []
    users = User.all
    users.each do |user|
      if(user.isplayer(0))
        players.push(user)
      end
    end
    return players
  end

  def isplayer(id)
    if(id == 0)
      if(self.canrole == 'premiere' || self.canrole == 'academy' || self.canrole == 'm21' || self.canrole == 'm18' || self.canrole == 'm16' || self.canrole == 'm15' || self.canrole == 'fe14' || self.canrole == 'fe13'  || self.canrole == 'fe12'  || self.canrole == 'fe11'  || self.canrole == 'fc10' || self.canrole == 'fc9' || self.canrole == 'fc8'  || self.canrole == 'fc7')
        return true
      else
        return false
      end
    else
      user = User.find(id)
      if(user.canrole == 'premiere' || user.canrole == 'academy' || user.canrole == 'm21' || user.canrole == 'm18' || user.canrole == 'm16' || user.canrole == 'm15' || user.canrole == 'fe14' || user.canrole == 'fe13'  || user.canrole == 'fe12'  || user.canrole == 'fe11'  || user.canrole == 'fc10' || user.canrole == 'fc9' || user.canrole == 'fc8'  || user.canrole == 'fc7')

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
      string = string + "<br> " +self.address2
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
    errors[:avatar] << "should be less than 5000KB" if avatar.size > 5.megabytes
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
