# I m using Termux android App on a Chromebook

function addLog() {
    CMD=$1 
    echo `date` - $1 >> ~/.kids-tools
}

echo 
echo
echo "      ******************** v0.3"
echo "      |    Hello Bastien!     |"
echo "      -------------------------"
echo
echo "    What do you want to do today?"
echo
echo "Commands available:"
echo 
echo "  update       => get the latest features"
echo "  netflix  📺   => will launch netflix"
echo "  photos   📷   => open google photos"
echo
 

# general aliases
alias ll="ls -la"
alias quit="killall com.termux"
alias exit="killall com.termux"

# kids aliases
alias update="git pull --rebase && source ~/.bashrc && addLog update"
alias up=update
alias netflix="termux-open-url https://www.netflix.com && addLog netflix"
alias photos="termux-open-url https://photos.google.com && addLog photos"


