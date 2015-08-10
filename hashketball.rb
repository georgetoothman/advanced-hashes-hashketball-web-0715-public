# Write your code here!
require 'pry'

def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        {:player_name => "Alan Anderson", 
         :number => 0, 
         :shoe => 16, 
         :points => 22, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 3, 
         :blocks => 1, 
         :slam_dunks => 1
       },
        {:player_name => "Reggie Evans", 
          :number => 30, 
          :shoe => 14, 
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7
        },
        {:player_name => "Brook Lopez", 
          :number => 11, 
          :shoe => 17, 
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee", 
          :number => 1, 
          :shoe => 19, 
          :points => 26, 
          :rebounds => 12, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5
          },
        {:player_name => "Jason Terry", 
          :number => 31, 
          :shoe => 15, 
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1
          }
      ]
    },
    :away => {:team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [
        {:player_name => "Jeff Adrien", 
          :number => 4, 
          :shoe => 18, 
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
          },
        {:player_name => "Bismak Biyombo", 
          :number => 0, 
          :shoe => 16, 
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 7, 
          :blocks => 15, 
          :slam_dunks => 10
          },
        {:player_name => "DeSagna Diop", 
          :number => 2, 
          :shoe => 14, 
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5
          },
        {:player_name => "Ben Gordon", 
          :number => 8, 
          :shoe => 15, 
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0
          },
        {:player_name => "Brendan Haywood", 
          :number => 33, 
          :shoe => 15, 
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 22, 
          :blocks => 5, 
          :slam_dunks => 12
        }
      ]
    }
  }

end

def home_team
  game_hash[:home]
end

def away_team
  game_hash[:away]
end

def all_players
  home_team[:players] + away_team[:players]
end

def find_player_by_name(name)
  all_players.find {|p| p[:player_name] == name }
end

def num_points_scored(player)
  found_player = find_player_by_name(player)
  found_player[:points] if found_player
end

def shoe_size(player)
  found_player = find_player_by_name(player)
  found_player[:shoe] if found_player
end

def find_team_by_name(name)
  if home_team[:team_name] == name
    home_team
  elsif away_team[:team_name] == name
    away_team
  end
end

def team_colors(team)
  found_team = find_team_by_name(team)
  found_team[:colors] if found_team
end

def team_names
  team_name_arr = []
  team_name_arr << home_team[:team_name]  
  team_name_arr << away_team[:team_name]
end

def player_numbers(team)
  find_team_by_name(team)[:players].map do |player|
    player[:number]
  end
  # players_numbers_array = []
  # find_team_by_name(team)[:players].map do |player|
  #   players_numbers_array << player[:number]
  #   players_numbers_array
  # end
end

def player_stats(player)
  found_player = find_player_by_name(player)
  found_player.delete(:player_name)
  found_player
end

def big_shoe_rebounds
  player_with_biggest_shoe_size = []
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      player_with_biggest_shoe_size << player[:rebounds]
    end
  end
  player_with_biggest_shoe_size.shift
end
