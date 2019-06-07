# Write your code here!
require "pry"

def game_hash
    game_hash = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [{
                player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks:1
            }, {
                player_name: "Reggie Evans",
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
            }, {
                player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
            },{
                player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
            },{
                player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
            }]
        },
        away: {
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: [{
                player_name: "Jeff Adrien",
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
            }, {
                player_name: "Bismack Biyombo",
                number: 0 ,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10
            }, {
                player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            }, {
                player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
            }, {
                player_name: "Kemba Walker" ,
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12
            }
            ]
        }
    }
end

def num_points_scored(name)
    scored = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    playerdata.each do |stat, value|
                        if value == name
                        scored = playerdata[:points]
                        end
                    end
                end
            end
        end
    end
    return scored
end

def shoe_size(name)
    shoesize = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    playerdata.each do |stat, value|
                        if value == name
                        shoesize = playerdata[:shoe]
                        end
                    end
                end
            end
        end
    end
    return shoesize
end

def team_colors(team)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data == team
                return team_data[:colors]
            end
        end
    end
end

def team_names
    teams = []
    game_hash.each do |location, team_data|
        teams << team_data[:team_name]
    end
    return teams
end

def player_numbers(team)
    jerseys = []
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team
            team_data.each do |attribute, data|
                if attribute == :players
                    data.each do |playerdata|
                        jerseys << playerdata[:number]
                    end
                end
            end
        end
    end
    jerseys
end

def player_stats(name)
    stats = 0
    game_hash.each do |location, team_data|
            team_data.each do |attribute, data|
                if attribute == :players
                    data.each do |playerdata|
                        if playerdata[:player_name] == name
                            stats = playerdata
                            stats.delete(:player_name)
                            return stats 
                        end
                    end
                end
            end
    end
end

def big_shoe_rebounds
    biggestshoe = 0
    rebounds = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    if playerdata[:shoe] > biggestshoe
                        biggestshoe = playerdata[:shoe]
                        rebounds = playerdata[:rebounds]
                    end
                end
            end
        end
    end
    rebounds
end

def most_points_scored
    points = 0
    highestscorer = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    if playerdata[:points] > points
                        points = playerdata[:points]
                        highestscorer =  playerdata[:player_name]
                    end
                end
            end
        end
    end
    highestscorer
end

def winning_team
    homepoints = 0
    awaypoints = 0
    game_hash[:home][:players].each do |playerdata|
        homepoints = homepoints + playerdata[:points]
    end
    game_hash[:away][:players].each do |playerdata|
        awaypoints = awaypoints + playerdata[:points]
    end

    if homepoints > awaypoints
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    namelength = 0
    longname = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    if playerdata[:player_name].length > namelength
                        namelength = playerdata[:player_name].length
                        longname = playerdata[:player_name]
                    end
                end
            end
        end
    end
    longname
end

def long_name_steals_a_ton?
    namelength = 0
    longname = 0
    steals = 0
    moststeals = 0

    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    if playerdata[:player_name].length > namelength
                        namelength = playerdata[:player_name].length
                        longname = playerdata[:player_name]
                        steals = playerdata[:steals]
                    end
                end
            end
        end
    end
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |playerdata|
                    if playerdata[:steals] > moststeals
                        moststeals = playerdata[:steals]
                    end
                end
            end
        end
    end

    if moststeals = steals
        return true
    end
end