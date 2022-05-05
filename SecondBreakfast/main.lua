import "Turbine"
import "Turbine.Gameplay"

-- Create new chat command
CheckMealTime = Turbine.ShellCommand()
ListMealTimes = Turbine.ShellCommand()

-- Variables used
getDate = Turbine.Engine.GetDate();
gameTime = getDate.Hour;
gameTime_min = getDate.Minute;
player = Turbine.Gameplay.LocalPlayer.GetInstance()


-- Checks the player race
function GetPlayerRace(PlayerRaceId)
    for RaceName, RaceID in pairs(Turbine.Gameplay.Race) do
        if PlayerRaceId == RaceID then
            return RaceName
        end
    end
end

player_race = GetPlayerRace(player:GetRace())

-- Checks if it is meal time
function CheckMealTime:Execute()

    -- Check time of day based on server time
    -- Breakfast
    if gameTime >= 7 and gameTime < 8 then
        Turbine.Shell.WriteLine("Good morning! It's time for breakfast!")
    -- Second Breakfast
    elseif gameTime >= 9 and gameTime < 10 then
        Turbine.Shell.WriteLine("It's time for <rgb=#FF00FF>second breakfast!</rgb>")
    -- Elevenses
    elseif gameTime >= 11 and gameTime < 12 then
        Turbine.Shell.WriteLine("It's time for elevenses!")
    -- Luncheon
    elseif gameTime >= 13 and gameTime < 14 then
        Turbine.Shell.WriteLine("It's time for luncheon!")
    -- Afternoon Tea
    elseif gameTime >= 15 and gameTime < 16 then
        Turbine.Shell.WriteLine("It's time for afternoon tea!")
    -- Dinner
    elseif gameTime >= 18 and gameTime < 19 then
        Turbine.Shell.WriteLine("It's dinner time!")
    -- Supper
    elseif gameTime >= 21 and gameTime < 22 then
        Turbine.Shell.WriteLine("It's supper time!")
    -- Not currently meal time
    else
        if player_race == "Hobbit" then
            Turbine.Shell.WriteLine("Be patient young hobbit, it is not yet meal time.")
        else
            Turbine.Shell.WriteLine("It is not meal time.")
        end
        -- Displays time left until next meal time
        if gameTime >= 8 and gameTime < 9 then
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for second breakfast in " .. next_meal_time .. " minutes.")
        elseif gameTime >= 10 and gameTime < 11 then
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for elevenses in " .. next_meal_time .. " minutes.")
        elseif gameTime >= 12 and gameTime < 13 then
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for luncheon in " .. next_meal_time .. " minutes.")
        elseif gameTime >= 14 and gameTime < 15 then
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for afternoon tea in " .. next_meal_time .. " minutes.")
        elseif gameTime >= 16 and gameTime < 18 then
            next_meal_time_hr = 18 - gameTime
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for dinner in " .. next_meal_time_hr .. " hour(s), " .. next_meal_time .. " minutes.")
        elseif gameTime >= 19 and gameTime < 21 then
            next_meal_time_hr = 21 - gameTime
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for supper in " .. next_meal_time_hr .. " hour(s), " .. next_meal_time .. " minutes.")
        elseif gameTime >= 22 and gameTime < 24 then
            next_meal_time_hr = 24 - gameTime + 7
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("It will be time for breakfast in " .. next_meal_time_hr .. " hour(s), " .. next_meal_time .. " minutes.")
        elseif gameTime >= 0 and gameTime < 7 then
            next_meal_time_hr = 7 - gameTime
            next_meal_time = 60 - gameTime_min
            Turbine.Shell.WriteLine("What are you doing up so late?")
            Turbine.Shell.WriteLine("It will be time for breakfast in " .. next_meal_time_hr .. " hour(s), " ..  next_meal_time .. " minutes!")
        end
    end

end

-- Lists Meal Times
function ListMealTimes:Execute()

    if player_race == "Hobbit" then
        Turbine.Shell.WriteLine("Come now young hobbit! You should know this!")
    end

    Turbine.Shell.WriteLine("The Seven Essential Meals of a Hobbit's Day:")
    Turbine.Shell.WriteLine("Breakfast: 7am - 8am")
    Turbine.Shell.WriteLine("Second Breakfast: 9am - 10am")
    Turbine.Shell.WriteLine("Elevnses: 11am - 12pm")
    Turbine.Shell.WriteLine("Luncheon: 1pm - 2pm")
    Turbine.Shell.WriteLine("Afternoon Tea: 3pm - 4pm")
    Turbine.Shell.WriteLine("Dinner: 6pm - 7pm")
    Turbine.Shell.WriteLine("Supper: 9pm - 10pm")

end

-- Register mealtime chat command
Turbine.Shell.AddCommand("mealtime", CheckMealTime)
Turbine.Shell.AddCommand("listmeals", ListMealTimes)