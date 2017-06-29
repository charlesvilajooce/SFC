class Match < ApplicationRecord
  has_many :matchevents
  has_many :matchevent1users
  has_many :matchevent2users
  has_many :matchlinks

  def getdate(value)
    if(value != nil)
      tmp = Time.at(value).strftime '%Y-%m-%dT%H:%M:%S'
      return tmp
    else
      return nil
    end
  end

  def getbrs(string)
    if( !string.blank?)
    return string.gsub(/\n/, '<br>')
      end
  end

  def getteamscore()
    potentials = self.matchevent1users.select { |u| u.thetype == "But" }
    return potentials.size
  end
  def getenemyscore()
    potentials = self.matchevents.select { |u| u.thetype == "But Adversaire" }
    return potentials.size
  end

end
