choices(){

    if [[ "$USER_CHOICE" == "Jamf Recon" ]]; then
        echo "Running Jamf Recon"
        sleep 2
        sudo jamf recon
        echo "Jamf Recon Complete"
        sleep 2
        continue
    elif [[ "$USER_CHOICE" == "Jamf Policy" ]]; then
        echo "Running Jamf Policy"
        sleep 2
        sudo jamf policy
        echo "Jamf Policy Complete" 
        sleep 2
        continue
    elif [[ "$USER_CHOICE" == "Renew Profile" ]]; then
        echo "Running Profile Renewal" 
        sleep 2
        sudo profiles -N
        echo "Profile Renewal Complete"
        sleep 2
        continue
    elif [[ "$USER_CHOICE" == "Exit" ]]; then
        echo "Closing Script" 
        exit 0
    else    
        echo "invalid option selected" 
    fi
}
while true; do
USER_CHOICE=$(osascript <<EOD
set options to {"Jamf Recon", "Jamf Policy", "Renew Profile", "Exit"}
choose from list options with title "JAMF Commands" with prompt "Select a JAMF command to execute:" default items {"Jamf Recon"}
EOD
)

choices
done
