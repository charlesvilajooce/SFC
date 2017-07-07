class Matchevent2user < ApplicationRecord
  belongs_to :user_one, :class_name => 'User', :foreign_key => 'user_one_id'
  belongs_to :user_two, :class_name => 'User', :foreign_key => 'user_two_id'

  def gettext()
    if (!self.commentaire.blank?)
      return self.commentaire
    else
      case self.thetype
        when "Echange"
          return ("Sortie de "+User.find(self.user_one_id).getname()+" pour "+User.find(self.user_two_id).getname())
        when "But"
          return ("But de "+User.find(self.user_one_id).getname()+" assisté par "+User.find(self.user_two_id).getname())
        else
          return ""
      end
    end
  end

  def getimg()

    case self.thetype
      when "Echange"
        return ("<img src='https://www.servette.biz/images/livescore/substitution.png' style='' >")
      when "But"
        return ("<img src='https://www.servette.biz/images/livescore/goal.png' style='' >")
      else
        return ""
    end
  end


end
