# -*- coding: utf-8 -*-
# <sagacity, toolbelt for sagacious coders>
# Copyright (C) <2012>  Gabriel Falcão <gabriel@nacaolivre.org>
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

export SAGACITY_SERVICES="mysql redis elasticsearch mongo"
export SERVICE_LOAD_mysql="mysqld"
export SERVICE_LOAD_mongo="mongod"
export SERVICE_LOAD_redis="redis-server /usr/local/etc/redis.conf"
export SERVICE_LOAD_elasticsearch="elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"

daemonize-service (){
    name=$1
    shift
    cmd=$@
    cd /tmp && ($@ 2>&1) 2>&1>/tmp/$name.output &
}

service-start (){
    name=$1
    pid=$(service-pid $name)
    if [ ! -z "$pid" ]; then
        return 1;
    fi;
    command=$(echo \$SERVICE_LOAD_$name)
    eval "daemonize-service $name $command"
    service-wait-for $name
}

service-stop (){
    name=$1
    pid=$(service-pid $name)
    if [ -z "$pid" ]; then
        return 1;
    fi;
    kill -9 $pid
    service-status-single $name
}

service-pid (){
    unset DYLD_LIBRARY_PATH
    name=$1
    echo $(ps aux | egrep $name | grep -v grep | awk '{ print $2 }' | xargs)
}

service-wait-for () {
    name=$1
    for attempt in {1..100}; do
        pid=$(service-pid $name)
        if [ -z "$pid" ]; then
            sleep 0.01
        else
            break;
        fi;
    done;
    service-status-single $name
}

service-status-single () {
    name=$1
    pad=$(printf '%0.1s' " "{1..60})
    padlength=60
    local status
    pid=$(service-pid $name)
    if [ -z "$pid" ]; then
        status="\033[1;31mSTOPPED\033[0m"
    else
        status="\033[1;32mRUNNING\033[0m"
    fi;
    printf $name
    printf '%*.*s' 0 $((padlength - ${#name} - ${#status} )) "$pad"
    printf $status
    echo
}

service-status (){
    name="$1";
    if [ ! -z "$name" ]; then
        service-status-single $name;
    else
        for name in $SAGACITY_SERVICES; do
            service-status-single $name
        done;
    fi;
}

service-run-all (){
    for name in $SAGACITY_SERVICES; do
        service-start $name
    done;
}
service-kill-all (){
    for name in $SAGACITY_SERVICES; do
        service-stop $name
    done;
}


service-log (){
    name=$1
    service-status-single $name
    tail -f "/tmp/$name.output"
}

_complete_service () {
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=`echo $SAGACITY_SERVICES`
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _complete_service service-start
complete -F _complete_service service-stop
complete -F _complete_service service-log
complete -F _complete_service service-pid
complete -F _complete_service service-status-single
complete -F _complete_service service-status
