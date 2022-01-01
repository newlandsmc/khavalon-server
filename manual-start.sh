#!/bin/bash

while true
do
  read -r -p "This will NOT start the server as a systemd service, are you sure you want to continue? [Y/n] " input
  case $input in
    [yY][eE][sS]|[yY])
      echo "Yes"
      break
    ;;
    [nN][oO]|[nN])
      echo "No"
      exit
    ;;
    *)
      echo "Invalid input..."
    ;;
  esac
done

echo "Server starting in 3 seconds (CTRL+C to cancel)..."
sleep 3

/usr/java/jdk-17.0.1+12/bin/java -Xms16G -Xmx16G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -jar paper.jar nogui

