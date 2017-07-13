c() { cd ~/dev/$1; }
_c() {_files -W ~/dev -/; }
compdef _c c