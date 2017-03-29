json.extract! user, :id, :level, :surname, :name, :email, :birthday, :parents, :photo_url, :injured, :injury_archive, :suspended, :cards_archive, :role, :school, :school_archive, :physic_char, :playtime, :arriving_date, :endcontrat_date, :sportactivity_archive, :created_at, :updated_at
json.url user_url(user, format: :json)
