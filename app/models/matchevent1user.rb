class Matchevent1user < ApplicationRecord
  belongs_to :user

  def gettext()
    if (!self.commentaire.blank?)
      return self.commentaire
    else
      case self.thetype
        when "But"
          return ("But de "+self.user.getname())
        when "Carton Jaune"
          return (self.user.getname()+" a recu un carton jaune")
        when "Carton Rouge"
          return (self.user.getname()+" a recu un carton rouge")
        when "Passe"
          return ("Passe de "+self.user.getname()+".")
        else
          return ""
      end
    end
  end


  def getimg()

    case self.thetype
      when "But"
        return ("<img src='https://www.servette.biz/images/livescore/goal.png' style='' >")
      when "Carton Jaune"
        return ("<img src='https://www.servette.biz/images/livescore/yellow-card.png' style='' >")
      when "Carton Rouge"
        return ("<img src='https://www.servette.biz/images/livescore/red-card.png' style='' >")
      when "Passe"
        return ""
      else

    end
  end


end