#!/usr/bin/bash
# a simple bash script that help in dowmloading movies fast and easy

##### Random Colour Scheme
NC='\033[0m' 		  				# No Color
Red='\033[0;31m'        			  	# Red
Green='\033[0;32m'        				# Green
Yellow='\033[0;33m'       				# Yellow
Blue='\033[0;34m'         				# Blue
Purple='\033[0;35m'       				# Purple
Cyan='\033[0;36m'         				# Cyan
White='\033[0;37m'        				# White
Random_color=`echo "\033[0;$((31 + $RANDOM % 9))m"`	# Random Color

######################################### An ascii art for starting animation ####################################################
##################################################################################################################################
##################################################################################################################################
echo -ne "${Random_color}
     ███▄ ▄███▓ ▒█████   ██▒   █▓ ██▓▓█████   ██████  ██▀███   ▄████▄
    ▓██▒▀█▀ ██▒▒██▒  ██▒▓██░   █▒▓██▒▓█   ▀ ▒██    ▒ ▓██ ▒ ██▒▒██▀ ▀█
    ▓██    ▓██░▒██░  ██▒ ▓██  █▒░▒██▒▒███   ░ ▓██▄   ▓██ ░▄█ ▒▒▓█    ▄
    ▒██    ▒██ ▒██   ██░  ▒██ █░░░██░▒▓█  ▄   ▒   ██▒▒██▀▀█▄  ▒▓▓▄ ▄██▒
    ▒██▒   ░██▒░ ████▓▒░   ▒▀█░  ░██░░▒████▒▒██████▒▒░██▓ ▒██▒▒ ▓███▀ ░
    ░ ▒░   ░  ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░░ ▒░ ░▒ ▒▓▒ ▒ ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
    ░  ░      ░  ░ ▒ ▒░    ░ ░░   ▒ ░ ░ ░  ░░ ░▒  ░ ░  ░▒ ░ ▒░  ░  ▒
    ░      ░   ░ ░ ░ ▒       ░░   ▒ ░   ░   ░  ░  ░    ░░   ░ ░
           ░       ░ ░        ░   ░     ░  ░      ░     ░     ░ ░
                             ░                                ░
  'My biggest fear is that eventually you will see me the way i see myself !!' ${NC}
"
##################################################################################################################################
##################################################################################################################################



############################## Making a movies directory at home page if doesn't exist ###########################################
##################################################################################################################################
##################################################################################################################################
if [ ! -d ~/movies ]; then
  mkdir -p ~/movies;
fi
##################################################################################################################################
##################################################################################################################################



############################### If arguments aren't provided then show this instruction ##########################################
##################################################################################################################################
##################################################################################################################################
if [ $# -eq 0 ]; then
    echo -e "${Green} ----------------------------------------------------------------------------"
    echo -e "     [usage   ]: [$0 -d [DATE] -m [MOVIE NAME] -q [QUALITY]]"
    echo -e "     [For e.g ]: [$0 -d  2022  -m 'the batman' -q   1080p  ]"
    echo -e "     [For help]: [$0 --help ]"
    echo -e " ----------------------------------------------------------------------------${NC}"
    exit 1
fi
##################################################################################################################################
##################################################################################################################################



###################################### Calling a function to display help ########################################################
##################################################################################################################################
##################################################################################################################################
display_help(){
echo -ne " ${Cyan}
 ,_________________________________________________________________________________________,
 |Usage       :  ./moviesrc.sh [DATE] [MOVIE NAME] [QUALITY]                               |
 |-----------------------------------------------------------------------------------------|
 |-d (date)   :  2022, 2021, 2020 and so on (specify the movie release date)               |
 |-m (movie)  :  (specify the complete movie name and if it's more than a word use quotes) |
 |-q (quality):  480p, 720p, 1080p, 2160p (if not specified the default is 1080p)          |
 |-----------------------------------------------------------------------------------------|
 |--imdb       : 10, 50 etc. (will recommend nth number of top-imdb based movies with date)|
 |-r, --random : (will give you a random good critically acclaimed movie name with date)   |
 |--getinfo    : (get info about any movie with rating and plot summary)                   |
 '-----------------------------------------------------------------------------------------'
,_____________________________________________________________________________________________,
|Few examples and uses                                                                        |
|---------------------------------------------------------------------------------------------|
|Example     :  ./moviesrc.sh -d 2019 -m Joker -q 1080p                                       |
|Example2    :  ./moviesrc.sh -m 'v for vendetta' -d 2005 -q 720p                             |
|Example3    :  ./moviesrc.sh -d 2019 -m 'toy story 4' -q 2160p                               |
|Example4    :  ./moviesrc.sh -d 1972 -m 'the godfather' (by default 1080p)                   |
|Example5    :  ./moviesrc.sh -d 1990 -m 'the godfather part III' (specify the name correctly)|
|Example6    :  ./moviesrc.sh --imdb 250 (will list top 250 imdb based movies with dates)     |
|Example7    :  ./moviesrc.sh --random (will randomly suggest you a good movie name)          |
|Example7    :  ./moviesrc.sh --getinfo (will provide the info for that movie with ratings)   |
'---------------------------------------------------------------------------------------------'
${NC}
"
}
##################################################################################################################################
##################################################################################################################################



############################### Getting imdb movie top-250 list for movie selection ##############################################
##################################################################################################################################
##################################################################################################################################
imdb(){
	##### listing the top-imdb movies with it's date
echo "----------------------------------------------------------------------------"
curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | head -n $no_of_movies

	##### prompting the user for movie number
echo "----------------------------------------------------------------------------"
read -p "Enter the Movie No. : " movie_num

	##### saving the movie name in a var using command substution
echo "----------------------------------------------------------------------------"

	##### assigning movie name, date and usable words
Movie_Name=`curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | head -n $movie_num | grep -w "$movie_num>" | grep -oP '(?<=>).*(?= )' | sed 's/ //'`
Movie_Date=`curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | head -n $movie_num | grep "$movie_num>" | awk -F'[()]' '{print $2}'`
Movie_Name_Dash=`echo ${Movie_Name,,} | sed 's/ /-/g'`

	##### searching for movies using given info
Searched_Movie=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep "1080p Torrent" | grep -v "span" | cut -d '"' -f 2 | sort -u`

echo "----------------------------------------------------------------------------"
read -p "Do you want to download '$Movie_Name' [Y|N]? " -n 1 -r
echo ""
echo "----------------------------------------------------------------------------"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -ne "${Red}Process Cancelled, the movie won't be downloaded !!!${NC}"
    echo ""
    echo "----------------------------------------------------------------------------"
    exit 1
fi

	##### downloading movies torrent
curl --silent --output $Movie_Name_Dash $Searched_Movie

	##### using webtorrent to downlaod movies
webtorrent $Movie_Name_Dash -o ~/movies/

	##### removing unnecessary files
rm $Movie_Name_Dash
echo "----------------------------------------------------------------------------"
}
##################################################################################################################################
##################################################################################################################################



################# Creating random number for movie selection if you want to watch/download random movie ##########################
##################################################################################################################################
##################################################################################################################################
get_random(){
echo "----------------------------------------------------------------------------"
	##### Creating random number for movie selection #####
random=$(( ( RANDOM % 250 )  + 1 ))

	##### ##### Listing movie name that was randomly generated #####
curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | grep -w "$random>"

	##### Assigning movie name, date and usable words #####
movieName=`curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | grep -w "$random>" | grep -oP '(?<=>).*(?= )' | sed 's/ //'`
movieDate=`curl -s https://www.imdb.com/chart/top/ | grep -v "font" | egrep '(dir.)|secondaryInfo' | grep -oP '(?<=>).*(?=<)' | sed '/^--$/!{N;s/\n/ /g}' | nl -w2 -s'> ' | grep -w "$random>" | awk -F'[()]' '{print $2}'`
movieNameDash=`echo ${movieName,,} | sed 's/ /-/g'`

	##### Searching for movies using given info #####
searchedMovie=`curl -s https://yts.mx/movies/$movieNameDash-$movieDate | grep "1080p Torrent" | grep -v "span" | cut -d '"' -f 2 | sort -u`
echo "----------------------------------------------------------------------------"
read -p "Are you sure, you want to download this movie [Y|N]? " -n 1 -r
echo ""
echo "----------------------------------------------------------------------------"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -ne "${Red}Process Cancelled, the movie won't be downloaded !!!${NC}"
    echo ""
    echo "----------------------------------------------------------------------------"
    exit 1
fi

	##### Downloading movies torrent if user wants #####
curl --silent --output $movieNameDash $searchedMovie

	##### Using webtorrent to downlaod movies #####
webtorrent $movieNameDash -o ~/movies/

	##### removing unnecessary files #####
rm $movieNameDash
echo "----------------------------------------------------------------------------"
}
##################################################################################################################################
##################################################################################################################################



################### Get movies information, imdb rates and reviews before watching it ############################################
##################################################################################################################################
##################################################################################################################################
get_info(){
echo "---------------------------------------------------------------------------------------"
echo -e " ${Green}      Input the details of the movie you want to get information about !!!  ${NC}    "
echo "---------------------------------------------------------------------------------------"

	##### Promting the user for movie name #####
read -p "Enter Movie Name : " Movie_Name
echo "-------------------------------------------------------------------------------------"

	##### Promting the user for movie date #####
read -p "Enter Movie Date : " Movie_Date
echo "-------------------------------------------------------------------------------------"

	##### Changing the movie name into usable format #####
Movie_Name_Dash=`echo ${Movie_Name,,} | sed 's/ /-/g'`

	##### Giving movie info to the user #####
Show_Name=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep "<h1>" | grep -oP '(?<=>).*(?=<)'`
Show_Release_Date=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep "<h2>" | grep -oP '(?<=>).*(?=<)' | sort -u | head -n1`
Show_Genre=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep "<h2>" | grep -oP '(?<=>).*(?=<)' | sort -u | tail -n1`
IMDB_Rating=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep 'itemprop="ratingValue"' |  grep -oP '(?<=>).*(?=<)'`
Show_Cast=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep 'itemprop="actor"' |  grep -oP '(?<=>).*(?=<)' |  grep -oP '(?<=>).*(?=<)' |  grep -oP '(?<=>).*(?=<)' | sed '$!s/$/,/' | xargs`
Plot_Summary=`curl -s https://yts.mx/movies/$Movie_Name_Dash-$Movie_Date | grep 'class="hidden-sm hidden-md hidden-lg"' |  grep -oP '(?<=>).*(?=<)'| sed 's/ //'`

        ##### Showing the info to the user #####
echo -ne "Movie Name   : ${Blue}$Show_Name\n${NC}"
echo -ne "Release Date : ${Yellow}$Show_Release_Date\n${NC}"
echo -ne "Movie Genre  : ${Purple}$Show_Genre\n${NC}"
echo -ne "IMDB Rate    : ${Cyan}$IMDB_Rating\n${NC}"
echo -ne "Movie Cast   : $Show_Cast\n"
echo "----------------------------------------------------------------------------------------------------------------------------"
echo -ne "Plot Summary : ${Random_color}$Plot_Summary\n${NC}"
echo "----------------------------------------------------------------------------------------------------------------------------"
}
##################################################################################################################################
##################################################################################################################################



################################# Adding Fuctions and commands to the script #####################################################
##################################################################################################################################
##################################################################################################################################
while :
do
    case "$1" in
      -h | --help) # will display help
          display_help
          exit 0
          ;;

      -i | --imdb) # will download movie using imdb list
          no_of_movies=$2
          if [ -z "$2" ]; then
              no_of_movies=250
          fi
          imdb
          exit 0
           ;;

      -r | --random) # will download random movie
          get_random
          exit 0
           ;;

      --getinfo) # will provide movie info
          get_info
          exit 0
           ;;

      --) # End of all options
          shift
          break
          ;;

      *)  # No more options
          break
          ;;

    esac
done
##################################################################################################################################
##################################################################################################################################



####################################### Using getopts to specify flags ###########################################################
##################################################################################################################################
##################################################################################################################################
while getopts ":d:m:q:" flag; do
  case "$flag" in
    d) # Specifying movie date using flag
      movie_date=${OPTARG};;

    m) # Specifying movie name using flag
      movie_name=${OPTARG};;

    q) # Speciying movie quality using flag (by defalut)
      movie_quality=${OPTARG};;
  esac
done
##################################################################################################################################
##################################################################################################################################



################################################### Core Commands ################################################################
##################################################################################################################################
##################################################################################################################################
##### if movie quality isn't provided (by deafult 1080p) #####
if [ ! "$movie_quality" ]; then
    movie_quality=1080p
fi

##### Changing the movie name in usable form with dashes #####
movie_name_dash=`echo ${movie_name,,} | sed 's/ /-/g'`

##### Searching for movies #####
search_movie=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep "$movie_quality Torrent" | grep -v "span" | cut -d '"' -f 2 | sort -u | head -n1`

##### Searching for subtitles #####
search_subtitle=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep 'title="Download Subtitles for' | cut -d '"' -f 2 | sort -u`

##### Verifying the info of the movie #####
echo "-------------------------------------------------------------------------------------"
Show_name=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep "<h1>" | grep -oP '(?<=>).*(?=<)'`
Show_release_date=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep "<h2>" | grep -oP '(?<=>).*(?=<)' | sort -u | head -n1 | cut -d " " -f 1`
Show_genre=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep "<h2>" | grep -oP '(?<=>).*(?=<)' | sort -u | tail -n1`
IMDB_rating=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep 'itemprop="ratingValue"' |  grep -oP '(?<=>).*(?=<)'`
Show_cast=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep 'itemprop="actor"' |  grep -oP '(?<=>).*(?=<)' |  grep -oP '(?<=>).*(?=<)' |  grep -oP '(?<=>).*(?=<)' | sed '$!s/$/,/' | xargs`
Plot_summary=`curl -s https://yts.mx/movies/$movie_name_dash-$movie_date | grep 'class="hidden-sm hidden-md hidden-lg"' |  grep -oP '(?<=>).*(?=<)'| sed 's/ //'`
	##### Showing the info to the user #####
echo -ne "Movie Name   : ${Blue}$Show_name\n${NC}"
echo -ne "Release Date : ${Yellow}$Show_release_date\n${NC}"
echo -ne "Movie Genre  : ${Purple}$Show_genre\n${NC}"
echo -ne "IMDB Rate    : ${Cyan}$IMDB_rating\n${NC}"
echo -ne "Movie Cast   : $Show_cast\n"
echo "----------------------------------------------------------------------------------------------------------------------------"
echo -ne "Plot Summary : ${Random_color}$Plot_summary\n${NC}"
echo "----------------------------------------------------------------------------------------------------------------------------"

read -p "Do you really wish to download movie '$Show_name' [Y|N]? " -n 1 -r
echo ""
echo "----------------------------------------------------------------------------------------------------------------------------"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -ne "${Red}Process Cancelled, the movie won't be downloaded !!!${NC}"
    echo ""
    echo "----------------------------------------------------------------------------------------------------------------------------"
    exit 1
fi

##### Downloading movie torrent if available #####
curl --silent --output $movie_name_dash $search_movie

##### Using web-torrent to download movies #####
webtorrent $movie_name_dash -o ~/movies/

##### Removing unneccesary files #####
rm $movie_name_dash
echo "----------------------------------------------------------------------------"
##################################################################################################################################
##################################################################################################################################
