export PATH=/usr/local/mysql/bin:$PATH
export PATH=$PATH:/usr/local/git/bin/

##
# Your previous /Users/rpriebe/.bash_profile file was backed up as /Users/rpriebe/.bash_profile.macports-saved_2012-08-05_at_13:20:11
##

# MacPorts Installer addition on 2012-08-05_at_13:20:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

cl(){
	cd "$1" ; ls -l
}

commit(){
	args="$@"
	files=`svn status | grep -e ^[AMD]`

	printf "Committing: \n$files\n"

	if(svn ci -qm "$files" $args); then
		printf "Result: [%s]\n" $(text green "OK")
		#printf "Files Updated: $(text yellow $args)\n"
		#notify-send "Success" "amadeus AMADEUS amadeus AMADEUS amadeus AMADEUS"
	else
		printf "Result: [%s]\n" $(text red "ERROR")
		#notify-send "Error" "An error occurred sending your commit."
	fi
}

lsc(){
	fileName="$1"
	ext=".css"
	compiledFile=${fileName:0:-5}$ext

	if(lessc $fileName $compiledFile); then
		printf "Result: $fileName -> $compiledFile [%s]\n" $(text green "OK")
	else
		printf "Result: $fileName -> $compiledFile [%s]\n" $(text red "ERROR")
	fi
}

text() { #{{{
	local color=${1}
	shift
	local text="${@}"

	case ${color} in
	red ) tput setaf 1 ; tput bold ;;
	green ) tput setaf 2 ; tput bold ;;
	yellow ) tput setaf 3 ; tput bold ;;
	blue ) tput setaf 4 ; tput bold ;;
	grey ) tput setaf 5 ;;
	esac

	echo -en "${text}"
	tput sgr0
} #}}}

alias grep='grep -n'
alias ls='ls -l'
