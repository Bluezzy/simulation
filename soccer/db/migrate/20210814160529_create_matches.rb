class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|

      t.timestamps
      t.numeric :awayTeamId
      t.numeric :homeTeamId
      t.string :score
    end
  end
end
