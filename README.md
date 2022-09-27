# moviesrcV0.1 (movie downloader)
(a script written in bash that downloads movie in an easy and efficient way.. (still under development) it will be updated frequently and it's ony for learning purposes, you can get the idea of this script by looking at it's source code. In order to download any movie you just need to specify the release date (followed by the "-d") and the movie name(followed by "-m"), while you can also specify the movie quality upto ("2160p, being the highest"))
##### In-order to use this tool effieciently please read the help manual !!!
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

2. usage2 : ./moviesrc.sh (info / syntax) - it should follow the same order in oder to download movie
![image](https://user-images.githubusercontent.com/92677594/192524526-6973ab51-57df-4e8e-bf9b-8d45f05e4e39.png)

3. usage3 : ./moviesrc.sh -d [DATE] -m [MOVIE NAME] -q [QUALITY] (if movie name is more than a word then use quotes "")
![image](https://user-images.githubusercontent.com/92677594/192525148-473f8f62-b2d1-4ee1-8f79-74475e0467aa.png)


4. usage4 : ./moviesrc.sh --imdb 250 (will list top 250 imdb based movies with dates)
![image](https://user-images.githubusercontent.com/92677594/192045910-047e8ce7-a692-4118-89b6-93002aa96ed2.png)
![image](https://user-images.githubusercontent.com/92677594/192045974-b6c531c5-b6a8-48c2-9719-2303adf2071d.png)

5. usage5 : ./moviesrc.sh --random (will randomly suggest you a good movie name)
![image](https://user-images.githubusercontent.com/92677594/192046264-905d21f1-291d-440b-95d9-68b5c07bbc61.png)
![image](https://user-images.githubusercontent.com/92677594/192046341-2cb83665-9ffc-43e3-b10b-96d7c2c1dd78.png)

##### Tested On Platforms
1. KaliLinux  [✔]
2. Ubuntu     [✔]
3. Termux     [✔]

##### [NOTE : This isn't a professional tool and is made for knowledge and self-use, if you wish to contribute you can talk to me in personal at my social handles like twitter @nischal700, and i have not uploaded the entire tool/script. This is just a demo and still under development. Thank you !!!]
