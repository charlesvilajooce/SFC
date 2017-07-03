class Match < ApplicationRecord
  has_many :matchevents
  has_many :matchevent1users
  has_many :matchevent2users
  has_many :matchlinks
  belongs_to :terrain
  belongs_to :adversaire, :class_name => 'Team', :foreign_key => 'adversaire_id'

  def getdate(value)
    if (value != nil)
      tmp = Time.at(value).strftime '%Y-%m-%dT%H:%M:%S'
      return tmp
    else
      return nil
    end
  end

  def getbrs(string)
    if (!string.blank?)
      return string.gsub(/\n/, '<br>')
    end
  end

  def getteamscore()
    if (self.when < Time.now.to_i || self.live || self.matchevent1users.size+self.matchevent2users.size+self.matchevents.size > 0)
      potentials = self.matchevent1users.select { |u| u.thetype == "But" }
      potentials2 = self.matchevent2users.select { |u| u.thetype == "But" }
      return (potentials.size+potentials2.size)
    else
      return '-'
    end

  end


  def getenemyscore()
    if (self.when < Time.now.to_i || self.live || self.matchevent1users.size+self.matchevent2users.size+self.matchevents.size > 0)
    potentials = self.matchevents.select { |u| u.thetype == "But Adversaire" }
    return potentials.size
    else
      return '-'
    end
  end

end
