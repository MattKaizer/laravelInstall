#!/bin/bash
# Demo-menu shell script
## ----------------------------------
# Define variables
# ----------------------------------
EDITOR=open -a textedit
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ----------------------------------
# User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	#Executable for setting project
    echo "Enter laravel name project..."
    read projectName
        pause
    composer create-project --prefer-dist laravel/laravel $projectName
    cd $projectName
    echo "Config your project..."
        pause
    open -a textedit .env
    echo "Adding laradock module... "
    git submodule add https://github.com/Laradock/laradock.git
    cd laradock
    cp env-example .env
    echo "Rename url's like:('allegra.test and www/allegra/public')"
    pause
    cd nginx/sites/
    cp laravel.conf.example $projectName.conf
    open -a textedit $projectName.conf
    cd ../../
    echo "Add host... ('127.0.0.1    allegra.test')"
        pause
    sudo nano /etc/hosts
    sleep 1 # Waits 1 seconds.
    echo "Installing npm dependencies... "
    cd ..
        pause
    rm webpack.mix.js && rm composer.json && rm package.json && rm -Rf /resources/js/ && rm -Rf /resources/sass
    git clone https://github.com/MattKaizer/LaravelConfig.git
    cd LaravelConfig
    cp webpack.mix.js ../ && cp composer.json ../ && cp package.json ../ && cp -R js ../resources/ && cp -R images ../resources/ && cp -R sass ../resources/
    rm -R LaravelConfig
    composer update
    npm i
    npm run dev
    cd laradock
    docker-compose up -d mysql nginx phpmyadmin
    echo "That's all folks... "
        pause
}

# do something in two()
two(){
	#Executable for setting project
    echo "Enter laravel name project..."
    read projectName
        pause
    composer create-project --prefer-dist laravel/laravel $projectName
    cd $projectName
    echo "Config your project..."
        pause
    open -a textedit .env
    echo "Adding laradock module... "
    git clone https://github.com/Laradock/laradock.git
    cd laradock
    cp env-example .env
    echo "Rename url's like:('allegra.test and www/allegra/public')"
    pause
    cd nginx/sites/
    cp laravel.conf.example $projectName.conf
    open -a textedit $projectName.conf
    cd ../../
    echo "Add host... ('127.0.0.1    allegra.test')"
        pause
    sudo nano /etc/hosts
    cd ..
    sleep 1 # Waits 1 seconds.
    echo "Installing npm dependencies... "
    cd $projectName
        pause
    rm webpack.mix.js && rm composer.json && rm package.json && rm -Rf /resources/js/ && rm -Rf /resources/sass
    git clone https://github.com/MattKaizer/LaravelConfig.git
    cd LaravelConfig
    cp webpack.mix.js ../ && cp composer.json ../ && cp package.json ../ && cp -R js ../resources/ && cp -R images ../resources/ && cp -R sass ../resources/
    cd ..
    rm -Rf LaravelConfig
    composer update
    npm i
    npm run dev
    cd ..
    cd laradock
    docker-compose up -d mysql nginx phpmyadmin
    echo "That's all folks... "
        pause
}

# do something in three()
three(){
    echo "Enter laravel name project..."
    read projectName
        pause
    composer create-project --prefer-dist laravel/laravel $projectName
    cd $projectName
    echo "Config your project..."
        pause
    open -a textedit .env
    rm webpack.mix.js && rm composer.json && rm package.json && rm -Rf /resources/js/ && rm -Rf /resources/sass
    git clone https://github.com/MattKaizer/LaravelConfig.git
    cd LaravelConfig
    cp webpack.mix.js ../ && cp composer.json ../ && cp package.json ../ && cp -R js ../resources/ && cp -R images ../resources/ && cp -R sass ../resources/
    cd ..
    rm -Rf LaravelConfig
    composer update
        pause
    npm i
        pause
    npm run dev
        pause
    cd ..
    cd laradock
    echo "Rename url's like:('allegra.test and www/allegra/public')"
        pause
    cd nginx/sites/
    cp laravel.conf.example $projectName.conf
    open -a textedit $projectName.conf
    cd ../../
    echo "Add host... ('127.0.0.1    allegra.test')"
        pause
    sudo nano /etc/hosts
    docker-compose up -d mysql nginx phpmyadmin
    echo "That's all folks... "
        pause

}


# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "  MBM-LARAVEL-CONFIG"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Install one project along single laradock..."
	echo "2. Install one project along multisite laradock..."
    echo "3. Install another laravel only..."
	echo "4. Exit"
}
# Lee la accion sobre el teclado y la ejecuta.
# Invoca el () cuando el usuario selecciona 1 en el menú.
# Invoca a los dos () cuando el usuario selecciona 2 en el menú.
# Salir del menu cuando el usuario selecciona 3 en el menú.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] " choice
	case $choice in
		1) one ;;
		2) two ;;
        3) three ;;
		4) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

#Advertisement
read_meNow() {
    clear
    echo "REMEMBER LEBOWSKY !!!!"
    echo "IF YOU RUN THIS FOR MULTISITE LARADOCK (ALREADY INSTALLED),"
    echo "RUN IT INTO THE ROOT WHERE LARADOCK FOLDER IS, OTHERWISE,"
    echo "IF YOU INSTALL SINGLE LARADOCK, RUN IT INTO ANOTHER URL"
}

# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
while true
do
    	read_meNow
	show_menus
	read_options
done

