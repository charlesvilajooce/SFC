class Match < ApplicationRecord
  has_many :matchevents
  has_many :matchevent1users
  has_many :matchevent2users
  has_many :matchlinks
end
