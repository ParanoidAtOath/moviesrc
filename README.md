# moviesrc (movie downloader)
( A script written in 'Bash' that downloads movie easily using torrents)

### In-order to use this tool effieciently please read the help manual !!!
##### Installation for Debian{/Linux/Ubuntu/WSL2}
	$ sudo apt-get install git
	$ git clone https://github.com/ParanoidAtOath/moviesrc.git
	$ cd moviesrc/
	$ chmod +x install.sh moviesrc.sh
	$ ./install.sh (if prompted type "y")

##### Installation for Android{/Termux}
	$ pkg install git -y
	$ git clone https://github.com/ParanoidAtOath/moviesrc.git
	$ cd moviesrc/
	$ chmod +x androidinstall.sh moviesrc.sh
	$ ./androidinstall.sh (if prompted type "y")

##### Screenshots and Usage
1. usage1 : ./moviesrc.sh --help/-h (for help page) - it shows the help manual of the script
![image](https://user-images.githubusercontent.com/92677594/192524250-f469db2a-c45e-48ee-897e-ff85737e1f07.png)

2. usage2 : ./moviesrc.sh (info/syntax) - follow the instructions in oder to download movie
![image](https://user-images.githubusercontent.com/92677594/192524526-6973ab51-57df-4e8e-bf9b-8d45f05e4e39.png)

3. usage3 : ./moviesrc.sh -d [DATE] -m [MOVIE NAME] -q [QUALITY] (if movie name is more than a word then use "")
![image](https://user-images.githubusercontent.com/92677594/192529487-45b03831-81b2-475a-8775-eb671642e49c.png)
![image](https://user-images.githubusercontent.com/92677594/192530189-bf2f910b-871b-4074-93f6-a03358a10220.png)

4. usage4 : ./moviesrc.sh --imdb 250 (will list top 250 imdb based movies for selection)
![image](https://user-images.githubusercontent.com/92677594/192530696-d31c840b-906f-4011-b6c9-18e269f66aa1.png)
![image](https://user-images.githubusercontent.com/92677594/192530966-44802a00-2525-4dc2-9750-841a787c15d0.png)

5. usage5 : ./moviesrc.sh --random (will randomly suggest you a good movie)
![image](https://user-images.githubusercontent.com/92677594/192531215-8ca87315-9157-454a-9980-e6a9cb48a0c0.png)
![image](https://user-images.githubusercontent.com/92677594/192531603-e3b5ea9c-d752-40f4-9c4f-e5b9eda4da93.png)

6. usage6 : ./moviesrc.sh --getinfo (provides the infomation about the movie with ratings)
![image](https://user-images.githubusercontent.com/92677594/192532039-ec808634-77eb-42da-a11b-7ea1fb1d355a.png)

#### Upcoming updates maybe :
1. Adding multiple subtitles for preferred language.
2. Adding multiple audio for different languages.
3. Adding Web Series/ Animes/ Tv Series/ Cartoons and many more.
4. Making a GUI interface for non CLI users.
5. Recursive movies and series downloading for sequels and episodes.
6. And so on !!!

#### [NOTE : This isn't a professional tool and is made for knowledge, fun and self-use. Thank you !!!]
