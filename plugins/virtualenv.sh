# -*- coding: utf-8 -*-
# <proative bash profile for mac>
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

export SAGACITY_VENV_HOME=$SAGACITY_MAIN/@virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=true

sagacity.plugins.virtualenv.link_hook (){
    sagacity_name=$1
    dotname=$2
    sagacity.ansi.green "Linking $dotname to $sagacity_name..."
    ln -s $sagacity_name $dotname;
    sagacity.ansi.green "OK\n"

}
sagacity.plugins.virtualenv.load() {
    local VENV_HOME

    VENV_HOME=$HOME/.virtualenvs

    sagacity.interaction.logo
    sagacity.ansi.yellow "\nInstalling virtualenvwrapper hooks..\n\n";

    for file in $(ls $SAGACITY_VENV_HOME); do
        local sagacity_name
        local dotname
        local choice
        local chosen

        chosen="false";

        sagacity_name=$SAGACITY_VENV_HOME/$file
        dotname=$VENV_HOME/$(sagacity.core.fs.unatify $file)

        if [ -e "$dotname" ]; then
            sagacity.ansi.print "'$SAGACITY_ANSI_RED$dotname$SAGACITY_ANSI_NC' already exists.\n"
            echo "Do you want to overwrite it with sagacity's own version?"

            while [ "$chosen" != "true" ]; do
              printf 'please choose between [Y,n]:\n';
              read choice;
              if [ "$choice" == "Y" -o "$choice" == "y" -o "x$choice" == "x" ]; then
                  rm -f $dotname;
                  sagacity.ansi.red "Removed $dotname\n";
                  sagacity.plugins.virtualenv.link_hook $sagacity_name $dotname;
                  break;
              elif [ "$choice" == "n" ]; then
                  return;
              fi;
            done;
        else
            sagacity.plugins.virtualenv.link_hook $sagacity_name $dotname;
        fi;
    done;
}
