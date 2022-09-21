#!/usr/bin/bash
# a simple bash script that help in dowmloading movies fast and easy

# an ascii art for starting animation
echo "----------------------------------------------------------------------------"
echo -e "
    ███╗░░░███╗░█████╗░██╗░░░██╗██╗███████╗░██████╗██████╗░░█████╗░
    ████╗░████║██╔══██╗██║░░░██║██║██╔════╝██╔════╝██╔══██╗██╔══██╗
    ██╔████╔██║██║░░██║╚██╗░██╔╝██║█████╗░░╚█████╗░██████╔╝██║░░╚═╝
    ██║╚██╔╝██║██║░░██║░╚████╔╝░██║██╔══╝░░░╚═══██╗██╔══██╗██║░░██╗
    ██║░╚═╝░██║╚█████╔╝░░╚██╔╝░░██║███████╗██████╔╝██║░░██║╚█████╔╝
    ╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░
'My biggest fear is that eventually you will see me the way i see myself !!'
			Author: Nischal Karki
			  Tool  : moviesrc
"
echo "----------------------------------------------------------------------------"

# making a help menu for beginners
if [ "$1" == "-h" ]; then
echo -e "
,_________________________________________________________________________________________,
|Usage       :  ./moviesrc.sh [DATE] [MOVIE NAME] [QUALITY]                               |
|-----------------------------------------------------------------------------------------|
|Date        :  2022, 2021, 2020 and so on (specify the movie release date)               |
|Movie name  :  (specify the complete movie name and if it's more than a word use quotes) |
|Quality     :  480p, 720p, 1080p, 2160p (if not specified the default is 1080p)          |
|-----------------------------------------------------------------------------------------|
|Example     :  ./moviesrc.sh 2019 Joker 1080p                                            |
|Example2    :  ./moviesrc.sh 2005 'v for vendetta' 720p                                  |
'-----------------------------------------------------------------------------------------'
"
 exit 0
fi

# making a movies directory at home page doesn't exist
if [ ! -d ~/movies ]; then
  mkdir -p ~/movies;
fi

# if arguments aren't provided then show this instruction
if [ $# -eq 0 ]; then
    echo "[usage  ]: [$0 [DATE] [MOVIE NAME] [QUALITY]]"
    echo "[For e.g]: [$0  2019     Joker       1080p  ]"
    exit 1
fi

# specifying the movie date
movie_date=$1

# specifying the movie name
movie_name=$2

# specifying the quality of movie
movie_quality=$3

# specifying the quality of movie if not provided
if [ -z "$3" ]; then
    movie_quality=1080p
fi

# changing the movie name in usable form with dashes
movie_name_dash=`echo ${movie_name,,} | sed 's/ /-/g'`

# searching for movies
search_movie=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep "$movie_quality Torrent" | grep -v "span" | cut -d '"' -f 2 | sort -u`

# searching for subtitles
search_subtitle=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep 'title="Download Subtitles for' | cut -d '"' -f 2 | sort -u`

# downloading movies torrent
curl -o $movie_name_dash $search_movie

# using web-torrent to download movies
webtorrent $movie_name_dash -o ~/movies/

# removing unneccesary files
rm $movie_name_dash

