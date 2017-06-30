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
      end
    end
  end

  def getimg()

    case self.thetype
      when "Echange"
        return ("<img src='/images/livescore/substitution.png' style='' >")
      else

    end
  end


end
