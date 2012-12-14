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


sagacity.plugins.projects.goto () {
    place=$1
    project=$2
    base_path="$HOME/projects/$place"
    optimal_path="$base_path/$project"
    alias optimal_path_exists="test -e $optimal_path"
    if [ ! `optimal_path_exists` ]; then
        mkdir -p $optimal_path
    fi;
    pushd $optimal_path
}
w () { sagacity.plugins.projects.goto work $*; }
p () { sagacity.plugins.projects.goto personal $*; }
third_party () { sagacity.plugins.projects.goto 3rdparty $*; }
alias 3=third_party

_complete_projects_for () {
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=`ls $HOME/projects/$1/`
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    export COMPREPLY
    return 0

}

_complete_projects_for_work () {
    _complete_projects_for work
    return $?
}

_complete_personal_projects () {
    _complete_projects_for personal
    return $?
}

_complete_3rdparty_projects () {
    _complete_projects_for 3rdparty
    return $?
}

complete -F _complete_projects_for_work w
complete -F _complete_personal_projects p
complete -F _complete_3rdparty_projects 3
