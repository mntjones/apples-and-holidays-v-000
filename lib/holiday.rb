require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  holiday_hash[:summer][:fourth_of_july][1]
  
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].collect do |holiday, list|
    list << "Balloons"
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
  holiday_hash.collect do |season, day|
    day.collect do |holiday, list|
      if holiday == :memorial_day
        list << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
  
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supply_list = []
  holiday_hash[:winter].collect do |holiday, supplies|
    supply_list << supplies
  end
  supply_list.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holder = []
  holiday_array = []
  holiday_cap = ""
  list_str = ""
  
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |day, list|
      if day.to_s.include? "_"
        holder = day.to_s.split("_")
        holder.collect do |word|
          holiday_array << word.capitalize
        end
        holiday_cap = holiday_array.join(" ")
      else
        holiday_cap = day.capitalize
      end
      holiday_array = []
      list_str = list.join(", ")
      puts "  #{holiday_cap}: #{list_str}"
      list_str = ""
    end
  end
  
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays = []
  holiday_hash.collect do |season, day|
    day.collect do |holiday, list|
      list.each do |item|
        if item == "BBQ"
          holidays << holiday
        end
      end
    end
  end
  holidays
end


all_supplies_in_holidays({
      :winter => {
        :christmas => ["Lights", "Wreath"],
        :new_years => ["Party Hats"]
      },
      :summer => {
        :fourth_of_july => ["Fireworks", "BBQ"]
      },
      :fall => {
        :thanksgiving => ["Turkey"]
      },
      :spring => {
        :memorial_day => ["BBQ"]
      }
    })




