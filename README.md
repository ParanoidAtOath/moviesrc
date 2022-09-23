# moviesrcV0.1 (movie downloader)
(a simple script written in bash that downloads movie in an easy and efficient way.. (still under development) it will be updated frequently and when it's fully completed the source code of this script will also be visible. In order to download any movie you just need to specify the release date and the movie name)
##### In-order to use this tool effieciently please read the help manual !!!
##### Installation for Debian{/Linux/Ubuntu/WSL2}
	$ sudo apt-get install git
	$ git clone https://github.com/ParanoidAtOath/moviesrc.git
	$ cd moviesrc/
	$ chmod +x install.sh moviesrc.sh
	$ ./install.sh

##### Installation for Android{/Termux}
	$ pkg install git -y
	$ git clone https://github.com/ParanoidAtOath/moviesrc.git
	$ cd moviesrc/
	$ chmod +x androidinstall.sh moviesrc.sh
	$ ./androidinstall.sh

##### Screenshots and Usage
1. usage1 : ./moviesrc.sh --help (for help page) - it shows the help manual of the script
![image](https://user-images.githubusercontent.com/92677594/192044211-36c4711a-f42f-4713-9369-9817a795212a.png)
![image](https://user-images.githubusercontent.com/92677594/192044615-0e72bae2-a34d-456f-ac75-c089f3d57986.png)

2. usage2 : ./moviesrc.sh (info / syntax) - it should follow the same order in oder to download movie
![image](https://user-images.githubusercontent.com/92677594/192044801-b7d12690-de6e-4db4-a946-207d74aea823.png)

3. usage3 : ./moviesrc.sh [DATE] [MOVIE NAME] [QUALITY] (for e.g : ./moviesrc.sh 2019 joker 1080p | ./moviesrc.sh 2022 "the batman" 720p)
![image](https://user-images.githubusercontent.com/92677594/192045296-601c600f-8aa2-4adc-bc82-0d4b38c63d97.png)
![image](https://user-images.githubusercontent.com/92677594/192045553-2e3e5a40-51af-4f7e-afbd-102a45e93143.png)

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
