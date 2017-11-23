class Matcheventlink < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :match


  def getorder()

    match = self.match
    events = match.matcheventlinks
    events = events.where.not(id: self.id)
=begin
    puts events.count
=end
    if events.count > 0
      events = events.sort_by { |e| -e.temps }

      orderRankToTake = -1

=begin
      BEGIN bullshit to make sure last one is on top...
=end
      currentorder = 99999
      tempevents = events.sort_by { |e| theorder }
      tempevents.each do |e|
        if e.temps == self.temps && e.theorder < currentorder
          orderRankToTake = e.theorder
          currentorder = e.theorder
        end

      end
=begin
       END bullshit to make sure last one is on top...
=end


=begin
      so no event has same time, lets check where it fits
=end
      biggest = 1
      if orderRankToTake == -1
        events.each_with_index do |e, i|
          if e.temps > self.temps
            if biggest == 1
              biggest = 0
              break
            end
          end
        end
      end
      if biggest == 1
        orderRankToTake = 1
      end


      currentorder = 99999
      if orderRankToTake == -1
        events.each_with_index do |e, i|
          if e.temps == self.temps || e.temps < self.temps
            if (currentorder > e.theorder)
              orderRankToTake = e.theorder
              currentorder = e.theorder
              break
            end
          end

        end
      end

      if orderRankToTake == -1
        orderRankToTake = events.count+1
      end


      events.each do |e|
        if e.theorder >= orderRankToTake
          e.theorder = e.theorder+1
          e.save
        end
      end

      self.theorder = orderRankToTake
      self.save

    else
      self.theorder = 1
      self.save
    end

  end

  def moveup()
    match = self.match
    events = match.matcheventlinks
    events = events.where.not(id: self.id)

    if events.count > 0
      events = events.sort_by { |e| -e.theorder }
      events.each do |e|
        if e.theorder == self.theorder+1 && e.temps == self.temps
          e.theorder = e.theorder-1
          e.save
          self.theorder = self.theorder+1
          self.save
          break
        end
      end
    end

  end

  def movedown()
    match = self.match
    events = match.matcheventlinks
    events = events.where.not(id: self.id)

    if events.count > 0
      events = events.sort_by { |e| -e.theorder }
      events.each do |e|
        if e.theorder == self.theorder-1 && e.temps == self.temps
          e.theorder = e.theorder+1
          e.save
          self.theorder = self.theorder-1
          self.save
          break
        end
      end
    end

  end

  def removefromorder()
    match = self.match
    events = match.matcheventlinks
    events = events.where.not(id: self.id)

    if events.count > 0
      events.each do |e|
        if e.theorder > self.theorder
          e.theorder = e.theorder-1
          e.save
        end
      end
    end

  end


end
