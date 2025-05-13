# Runs tree with directories only and default depth 2
function dtree(){
    if [ -z "$1" ];then
        tree -d -L 2
    else
        tree -d -L "$1"
    fi
}
