unset HISTFILE
export PGHOST=localhost
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PYTHONPATH=/Users/daviddouglas/Develop/qgis_scripts:/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH=/usr/local/bin:/usr/local/pgsql-9.3/bin:/Library/Frameworks/GDAL.framework/Versions/1.10/Programs/:$PATH
export PATH=/Users/daviddouglas/Develop/e00compr-1.0.1:/Users/daviddouglas/Developer/builds:/Users/daviddouglas/Develop/builds/watirchromedriver/:$PATH
export PATH=/usr/local/opt:/Users/daviddouglas/build/TextMate/Applications/mate:/usr/local/lib:$PATH
export PATH=/usr/local/octave/3.8.0/bin:$PATH

alias chrome='open /Applications/Google\ Chrome.app'
alias firefox='open /Applications/Firefox.app'
alias excel='open /Applications/Microsoft\ Excel.app'
alias notes='open /Applications/Notes.app'
alias qgis='open /Applications/QGIS.app'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app' 
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
alias encrypt='gpg --encrypt --sign --armor /Users/daviddouglas/Develop/builds/msgs/outgoing_e.txt'
alias pwencrypt='gpg --symmetric --cipher-algo TWOFISH'
alias gpgadd='gpg --import'

alias loadomsg='ruby /Users/daviddouglas/Develop/builds/msgs/e_msg.rb'
alias loadmsg='ruby /Users/daviddouglas/Develop/builds/msgs/prep_emsg.rb'
alias decrypt='gpg --decrypt /Users/daviddouglas/Develop/builds/msgs/emsg.txt'
alias delmsg='rm /Users/daviddouglas/Develop/builds/msgs/emsg.txt'

e()
{
loadomsg
encrypt
echo "




	tempfile kept. delete outgoing.txt if it needs to go. otherwise it will just be overwritten next time."
mate /Users/daviddouglas/Develop/builds/msgs/outgoing_e.txt.asc
}

go()
{
	loadmsg
	decrypt
	delmsg
	echo "
	
	
	
	tempfile deleted. deleting bash history and exiting.
	"
	history -c && history -w
}


alias runtopo='ruby /Users/daviddouglas/Desktop/GIS\ Data\ Archive/_South\ Carolina/DNR/topos/find_and_convert_topo.rb'
alias opentopo='open /Users/daviddouglas/Desktop/GIS\ Data\ Archive/_South\ Carolina/DNR/topos/shps'
topo()
{
runtopo
opentopo
}
