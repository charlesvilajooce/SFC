class Matchevent < ApplicationRecord
  belongs_to :match

  def gettext()
    if (!self.commentaire.blank?)
      return self.commentaire
    else
      case self.thetype
        when "But Adversaire"
          return ("But pour "Team.find(self.match.adversaire).name+".")
        when "Carton Jaune Adversaire"
          return (Team.find(self.match.adversaire).name+" a recu un carton jaune.")
        when "Carton Rouge Adversaire"
          return (Team.find(self.match.adversaire).name+" a recu un carton rouge.")
        when "Echange Adversaire"
          return (Team.find(self.match.adversaire).name+" a effectué un remplacement.")
        when "Coup franc"
          return ("Coup franc")
        when "Corner"
          return ("Corner")
        when "Fin de match"
          return ("Fin de match")
        else

      end
    end
  end

  def getimg()
    case self.thetype
      when "But Adversaire"
        return ("<img src='https://www.servette.biz/images/livescore/goal.png' style='' >")
      when "Carton Jaune Adversaire"
        return ("<img src='https://www.servette.biz/images/livescore/yellow-card.png' style='' >")
      when "Carton Rouge Adversaire"
        return ("<img src='https://www.servette.biz/images/livescore/red-card.png' style='' >")
      when "Echange Adversaire"
        return ("<img src='https://www.servette.biz/images/livescore/substitution.png' style='' >")
      when "Corner"
        return ("<img src='https://www.servette.biz/images/livescore/corner.png' style='' >")
      when "Coup franc"
        return ("<img src='https://www.servette.biz/images/livescore/freekick.png' style='' >")
      when "Sifflet"
        return ("<img src='https://www.servette.biz/images/livescore/whistle.png' style='' >")
      when "Fin de match"
        return ("<img src='https://www.servette.biz/images/livescore/whistle.png' style='' >")
      else
    end

  end

end
