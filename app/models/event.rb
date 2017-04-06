class Event < ApplicationRecord


  def getdate(value)
    tmp = Time.at(value).strftime '%Y-%m-%dT%H:%M:%S'

    return tmp
  end

  def getnicedate(value)
    tmp = Time.at(value).strftime '%d/%m/%Y à %H:%M'

    return tmp
  end
end
