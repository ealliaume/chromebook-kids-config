# I m using Termux android App on a Chromebook

function addLog() {
    CMD=$1 
    echo `date` - $1 >> ~/.kids-tools
}

echo 
echo
echo "      ******************** v0.2"
echo "      |    Hello Bastien!     |"
echo "      -------------------------"
echo
echo "    What do you want to do today?"
echo
echo "Commands availlable:"
echo 
echo "  update    => get the latest features"
echo "  netflix   => will launch netflix"
echo
echo 

# general aliases
alias ll="ls -la"
alias quit="killall com.termux"
alias exit="killall com.termux"

# kids aliases
alias update="git pull --rebase && source ~/.bashrc && addLog update"
alias netflix="termux-open-url https://www.netflix.com && addLog netflix"

