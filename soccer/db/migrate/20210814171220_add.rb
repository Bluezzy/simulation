class Add < ActiveRecord::Migration[6.1]
  def change
    add_reference :calendars, :championship, index:true
  end
end
