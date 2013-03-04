myip() {
    ifconfig en1 | egrep inet\\s | awk '{ print $2 }'
}
