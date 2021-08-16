class Calendar < ApplicationRecord
  validates :number_of_teams, presence: true, numericality: {only_integer: true, even: true, greater_than: 0, less_than_or_equal_to: 20}
  has_many :matches
  has_many :days
  belongs_to :championship

  def self.reverse_pairs(day)
    result = []
    day.each do |pair|
      result.push([pair[1], pair[0]])
    end
    return result
  end

  def first_day # on first day, team with id of 1 will play team with the last id, team with id of 2 will play team with penultimate id, and so on.
    numbers = 1.upto(number_of_teams).to_a
    result = []
    while numbers.length > 0
      result.push([numbers.min, numbers.max])
      numbers.delete(numbers.min)
      numbers.delete(numbers.max)
    end
    return result
  end

  def next_day(day, swap_type) # 2 swap mechanism to generate a pattern for the next day, both using first team as a pivot.
    result = []

    if swap_type == 'A'
      result.push([day.last.last, day.first.first])
      day.reverse.each_with_index do |pair, i|
        if day[i+1]
          result.push([day.reverse[i+1].last, day.reverse[i].first])
        end
      end
    end

    if swap_type == 'B'
      result.push([day.first.last, day.last.last])
      day.reverse.each_with_index do |pair, i|
        if day[i+2]
          result.push([day.reverse[i+1].last, day.reverse[i].first])
        end
      end
      result.push([day.first.first, day[1].first]) #reastablishing first team as the pivot in preparation for swap type A the next day.
    end

    return result
  end

  def round_robin
    current_day = self.first_day
    all_days = { 1 => current_day }
    2.upto(number_of_teams - 1) do |n|
      if n.even?
        current_day = self.next_day(current_day, 'A')
      else
        current_day = self.next_day(current_day, 'B')
      end
      all_days[n] = current_day
    end
    return all_days
  end

  def double_round_robin
    first_phase = self.round_robin
    full_phase = first_phase.clone
    first_phase.each do |day_number, matches|
      return_day_number = day_number + first_phase.length
      full_phase[return_day_number] = Calendar.reverse_pairs(matches)
    end
    return full_phase
  end
end
