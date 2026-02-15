#!/usr/bin/env bash

url=$(playerctl metadata mpris:artUrl)
artist=$(playerctl metadata xesam:artist)
album=$(playerctl metadata xesam:album)
metadata=$(printf "$artist - $album")

if [ $url == "No player found" ]
then
  exit
elif [ -f /home/theblack/.cache/albumart/"$metadata".png ]
then
  echo /home/theblack/.cache/albumart/"$metadata".png
else
  curl -s $url -o /home/theblack/.cache/albumart/"$metadata"
  magick /home/theblack/.cache/albumart/"$metadata" /home/theblack/.cache/albumart/"$metadata".png
  rm /home/theblack/.cache/albumart/"$metadata"
  echo /home/theblack/.cache/albumart/"$metadata".png
fi
