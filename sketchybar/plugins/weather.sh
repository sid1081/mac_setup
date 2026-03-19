#!/usr/bin/env zsh

LOCATION_JSON=$(curl -s "http://ip-api.com/json/")

LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
REGION="$(echo $LOCATION_JSON | jq '.regionName' | tr -d '"')"
COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
  sketchybar --set $NAME label=$LOCATION
  return
fi

TEMPERATURE=$(echo $WEATHER_JSON | jq '.data.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.data.current_condition[0].weatherDesc[0].value' | tr -d '"')
RAIN=$(echo $WEATHER_JSON | jq '[.data.weather[0].hourly[].chanceofrain | tonumber] | max | floor')
SNOW=$(echo $WEATHER_JSON | jq '[.data.weather[0].hourly[].chanceofsnow | tonumber] | max | floor')

LABEL="$LOCATION • ${TEMPERATURE}℃ • $WEATHER_DESCRIPTION"

if [ "$RAIN" -gt 0 ] 2>/dev/null; then
  LABEL="$LABEL •  ${RAIN}%"
fi
if [ "$SNOW" -gt 0 ] 2>/dev/null; then
  LABEL="$LABEL •  ${SNOW}%"
fi

sketchybar --set $NAME label="$LABEL"