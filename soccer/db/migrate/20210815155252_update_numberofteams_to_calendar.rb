class UpdateNumberofteamsToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :number_of_teams, :integer
    remove_column :calendars, :numberOfTeams
  end
end
