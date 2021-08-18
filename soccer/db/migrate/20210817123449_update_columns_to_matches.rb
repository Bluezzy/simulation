class UpdateColumnsToMatches < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :awayTeamId
    remove_column :matches, :homeTeamId
    add_column :matches, :home_team_id, :integer
    add_column :matches, :away_team_id, :integer
  end
end
