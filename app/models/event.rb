class Event < ApplicationRecord

  validates :begin, presence: true
  validates :end, presence: true

  has_many :subscriptions
  has_many :users, through: :subscriptions

  def getdate(value)
    if(value != nil)
      tmp = Time.at(value).strftime '%Y-%m-%dT%H:%M:%S'
      return tmp
    else
      return nil
    end
  end

  def gettime(value)
    if(value != nil)
      tmp = Time.at(value).strftime '%H:%M'
      return tmp
    else
      return nil
    end
  end

  def textstart()
    value = self.begin
    if(value != nil)
      tmp = Time.at(value).strftime '%H:%M'
      return tmp
    else
      return nil
    end

  end

  def textend()
    value = self.end
    if(value != nil)
      tmp = Time.at(value).strftime '%H:%M'
      return tmp
    else
      return nil
    end

  end

  def getnicedate(value)
    if(value != nil)
      tmp = Time.at(value).strftime '%d/%m/%Y à %H:%M'
      return tmp
    else
      return nil
    end

  end

  def getcolor()
    color = ''
    case self.eventtype
      when 1
        color = 'red'
      when 2
        color = 'grenat'
      else
        color = 'gray'
    end
    return color
  end

  def geteventtype()
    color = ''
    case self.eventtype
      when 1
        color = 'Match'
      when 2
        color = 'Entrainement'
      else
        color = 'gray'
    end
    return color
  end

end
