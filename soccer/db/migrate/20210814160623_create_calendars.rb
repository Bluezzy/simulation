class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.numeric :numberOfTeams
      t.timestamps
    end
  end
end
