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
	                  Tool: moviesrc
"
echo "----------------------------------------------------------------------------"

# making a movies directory at home page if doesn't exist
if [ ! -d ~/movies ]; then
  mkdir -p ~/movies;
fi

# if arguments aren't provided then show this instruction
if [ $# -eq 0 ]; then
    echo "----------------------------------------------------------------------------"
    echo "[usage  ]: [$0 [DATE] [MOVIE NAME] [QUALITY]]"
    echo "[For e.g]: [$0  2019     Joker       1080p  ]"
    echo "----------------------------------------------------------------------------"
    exit 1
fi

display_help(){
echo -e "
,_________________________________________________________________________________________,
|Usage       :  ./moviesrc.sh [DATE] [MOVIE NAME] [QUALITY]                               |
|-----------------------------------------------------------------------------------------|
|Example     :  ./moviesrc.sh 2019 Joker 1080p                                            |
'-----------------------------------------------------------------------------------------'
,_________________________________________________________________________________________,
|Core commands                                                                            |
|-----------------------------------------------------------------------------------------|
|Date        :  2022, 2021, 2020 and so on (specify the movie release date)               |
|Movie name  :  (specify the complete movie name and if it's more than a word use quotes) |
|Quality     :  480p, 720p, 1080p, 2160p (if not specified the default is 1080p)          |
|-----------------------------------------------------------------------------------------|
|Example2    :  ./moviesrc.sh 2005 'v for vendetta' 720p                                  |
'-----------------------------------------------------------------------------------------'
,_________________________________________________________________________________________,
|Other usefull commands                                                                   |
|-----------------------------------------------------------------------------------------|
|--imdb       : 10, 50 etc. (will recommend nth number of top-imdb based movies with date)|
|-r, --random : (will give you a random good critically acclaimed movie name with date)   |
|-----------------------------------------------------------------------------------------|
|Example3    :  ./moviesrc.sh --imdb 100 (will list top 100 imdb based movies)            |
|Example4    :  ./moviesrc.sh --random (will randomly suggest you a good movie name)      |
'-----------------------------------------------------------------------------------------'
,_________________________________________________________________________________________,
|Few examples and uses                                                                    |
|-----------------------------------------------------------------------------------------|
|Example     :  ./moviesrc.sh 2019 Joker 1080p                                            |
|Example2    :  ./moviesrc.sh 2005 'v for vendetta' 720p                                  |
|Example3    :  ./moviesrc.sh 2019 'toy story 4' 2160p                                    |
|Example4    :  ./moviesrc.sh 1972 'the godfather' (by default 1080p)                     |
|Example5    :  ./moviesrc.sh 1990 "the godfather part III" (specify the name correctly)  |
|Example6    :  ./moviesrc.sh --imdb 250 (will list top 250 imdb based movies with dates) |
|Example4    :  ./moviesrc.sh --random (will randomly suggest you a good movie name)      |
'-----------------------------------------------------------------------------------------'
"
}

# getting imdb movie top-250 list for movie selection
imdb(){
echo "----------------------------------------------------------------------------"
curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | head -n $no_of_movies
echo "----------------------------------------------------------------------------"
}

# creating random number for movie selection if you want to watch random movie
get_random(){
echo "----------------------------------------------------------------------------"
random=$(( ( RANDOM % 250 )  + 1 ))
curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | grep -w "$random>"
echo "----------------------------------------------------------------------------"
}

while :
do
    case "$1" in
      -h | --help)
          display_help
          exit 0
          ;;

      --imdb)
	  no_of_movies=$2
          imdb
          exit 0
           ;;

      -r | --random)
          get_random
	  exit 0
           ;;

      --) # End of all options
          shift
          break
          ;;
      -*)
	  echo "----------------------------------------------------------------------------"
          echo " Error: Unknown option: $1" >&2
 	  echo "----------------------------------------------------------------------------"
	  display_help
          exit 1 
          ;;
      *)  # No more options
          break
          ;;
    esac
done

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

