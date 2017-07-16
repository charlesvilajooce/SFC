class Match < ApplicationRecord
  has_many :matchevents
  has_many :matchevent1users
  has_many :matchevent2users
  has_many :matchlinks
  belongs_to :terrain
  belongs_to :adversaire, :class_name => 'Team', :foreign_key => 'adversaire_id'

  def orderplayers(players)
    users = players.sort_by { |e| e.name }
    # users = players
    users1 = users.select { |u|  u.role == 1}
    users2 = users.select { |u| u.role == 2}
    users3 = users.select { |u| u.role == 3}
    users4 = users.select { |u| u.role == 4}
    users5 = users.select { |u| u.role.blank?}
    orderedplayers = users1 + users2 + users3 + users4 + users5
    # print (o  rderedplayers)
    return orderedplayers

  end


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

  def getcoupe()

    if self.competition == 'Brack.ch Challenge League'
      return 'https://www.servette.biz/images/CatBrackChallengeLeague.png'
    end
    if self.competition == 'Amical'
      return 'https://www.servette.biz/images/amical.png'
    end
    if self.competition == 'Coupe Suiss'
      return 'https://www.servette.biz/images/catCoupeSuiss.png'
    end
  end
  def getlength()

    temps = 90
    if !self.matchevents.blank?
      self.matchevents.each do |me|
        if me.thetype == "Fin de match"
          temps = me.temps
        end
      end
    end
    if self.when > Time.now.to_i
      temps = 0
    end
    return temps
  end

  def getbuts(playerid)
    buts = 0
    self.matchevent2users.each do |me|
      if me.thetype == "But" && me.user_one_id == playerid
        buts = buts+1
      end
    end
    self.matchevent1users.each do |me|
      if me.thetype == "But" && me.user_id == playerid
        buts = buts+1
      end
    end
    return buts
  end

  def getcj(playerid)
    buts = 0
    self.matchevent1users.each do |me|
      if me.thetype == "Carton Jaune" && me.user_id == playerid
        buts = buts+1
      end
    end
    return buts
  end
  def getcr(playerid)
    buts = 0
    self.matchevent1users.each do |me|
      if me.thetype == "Carton Rouge" && me.user_id == playerid
        buts = buts+1
      end
    end
    return buts
  end


  def gettitulaires()
    mains = []
    self.matchlinks.each do |l|
      if l.thetype == 'titulaires'
        mains.push(l.user)
      end
    end
    return mains
  end

  def getremplacents()
    mains = []
    self.matchlinks.each do |l|
      if l.thetype == 'remplacents'
        mains.push(l.user)
      end
    end
    return mains
  end

  def getabsents()
    mains = []
    self.matchlinks.each do |l|
      if l.thetype == 'absents'
        mains.push(l.user)
      end
    end
    return mains
  end

  def getchange(playerid)
    change = ''
    self.matchevent2users.each do |me|
      if me.thetype == "Echange" && me.user_two_id == playerid
        change = '<img src="https://www.servette.biz/images/livescore/arrow_up.gif" style="max-height: 15px;">'
      end
      if me.thetype == "Echange" && me.user_one_id == playerid
        change = '<img src="https://www.servette.biz/images/livescore/arrow_down.gif" style="max-height: 15px;">'
      end
    end
    return change
  end

  def getassists(playerid)
    assists = 0
    self.matchevent2users.each do |me|
      if me.thetype == "But" && me.user_two_id == playerid
        assists = assists+1
      end
    end
    return assists
  end

  def gettimetitulaireplayer(playerid)
    showed = 0
    temps = 0
    self.matchevent2users.each do |me|
      if me.thetype == "Echange" && me.user_one_id == playerid
        showed = 1
        temps = me.temps
      end
      if showed == 0
        temps = self.getlength()
      end
    end
    return temps
  end

  def gettimeremplacentplayer(playerid)
    entre = 0
    sort = 0
    temps1 = 0
    temps2 = 0
    temps = 0

    self.matchevent2users.each do |me|
      if me.thetype == "Echange" && me.user_two_id == playerid
        entre = 1
        temps1 = me.temps
      end
      if me.thetype == "Echange" && me.user_one_id == playerid
        sort = 1
        temps2 = me.temps
      end
    end
    if entre == 1 && sort == 0
      temps = self.getlength()-temps1
    end
    if entre == 1 && sort == 1
      temps = temps2-temps1
    end

    return temps
  end
end

