class Matchevent < ApplicationRecord
  belongs_to :match

  def gettext()
    if (!self.commentaire.blank?)
      return self.commentaire
    else
      case self.thetype
        when "But Adversaire"
          return (Team.find(self.match.adversaire).name+" a marqué un but.")
        when "Carton Jaune Adversaire"
          return (Team.find(self.match.adversaire).name+" a recu un carton jaune.")
        when "Carton Rouge Adversaire"
          return (Team.find(self.match.adversaire).name+" a recu un carton rouge.")
        when "Remplacement Adversaire"
          return (Team.find(self.match.adversaire).name+" a effectué un remplacement.")
        when "Coup franc"
          return ("Coup franc")
        when "Corner"
          return ("Corner")
        else

      end
    end
  end

  def getimg()
    case self.thetype
      when "But Adversaire"
        return ("<img src='/images/livescore/goal.png' style='' >")
      when "Carton Jaune Adversaire"
        return ("<img src='/images/livescore/yellow-card.png' style='' >")
      when "Carton Rouge Adversaire"
        return ("<img src='/images/livescore/red-card.png' style='' >")
      when "Remplacement Adversaire"
        return ("<img src='/images/livescore/substitution.png' style='' >")
      when "Corner"
        return ("<img src='/images/livescore/corner.png' style='' >")
      else
    end

  end

end
