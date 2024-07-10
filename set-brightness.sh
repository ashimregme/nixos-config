#!/etc/profiles/per-user/ashim/bin/zsh

target_string="Display not found"

set_brightness() {
  local brightness_value=$1

  while true; do
    output=$(ddcutil setvcp 10 $brightness_value 2>&1)

    echo "Command output: ${output}, output length: ${#output}"

    if [[ "$output" == *"$target_string"* ]]; then
      echo "Error!. Running the command again..."
    else
      echo "Error not found. Exiting the loop."
      break
    fi
    
    # Add a sleep interval to avoid rapid looping (optional)
    sleep 3
  done
}

# Get the current hour (24-hour format)
current_hour=$(date +%H)

# Define the day and night time ranges
day_start=06
day_end=19

if [[ $current_hour -ge $day_start && $current_hour -lt $day_end ]]; then
  echo "It's daytime, increasing brightness..."
  set_brightness 100
else
  echo "It's nighttime, decreasing brightness..."
  set_brightness 30
fi
echo "Brightness adjusted!, exiting"
exit 1