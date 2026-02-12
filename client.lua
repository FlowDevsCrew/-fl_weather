local WEATHER = "EXTRASUNNY"
local RAIN_LEVEL = 0.0

RegisterNetEvent("fl_weather:setWeather", function(weatherType, rainLevel)
  if type(weatherType) == "string" and weatherType ~= "" then
    WEATHER = string.upper(weatherType)
  end

  if rainLevel ~= nil then
    local value = tonumber(rainLevel) or 0.0
    RAIN_LEVEL = math.max(0.0, math.min(1.0, value))
  end
end)

CreateThread(function()
  while true do
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(WEATHER)
    SetWeatherTypeNowPersist(WEATHER)
    SetWeatherTypeNow(WEATHER)
    SetRainLevel(RAIN_LEVEL)
    SetSnowLevel(0.0)
    SetWindSpeed(0.0)
    SetWindDirection(0.0)
    SetPedWetnessHeight(PlayerPedId(), 0.0)
    Wait(5000)
  end
end)
