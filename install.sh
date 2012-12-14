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

DESTINATION=$HOME/.sagacity
REPO=git://github.com/gabrielfalcao/sagacity.git

if [ ! -e "$DESTINATION" ]; then
    git clone -q $REPO $DESTINATION
fi;

if ! grep -qc "$DESTINATION/setup.sh" $HOME/.bash_profile; then
    echo "source $DESTINATION/setup.sh" >> $HOME/.bash_profile
    echo "Sagacity is now active for the next bash sessions."
else
    (cd $DESTINATION && git pull $REPO master && cd -)
    if [ "$?" == "0" ]; then
        echo "Sagacity was  successfully updated!"
    else
        echo "It looks like Sagacity is already installed, but running 'git pull $REPO master' failed"
    fi;
fi

source $DESTINATION/setup.sh

echo "Sagacity is active."
echo "You can find its documentation here: https://github.com/gabrielfalcao/sagacity/blob/master/README.md"
echo
echo "Thanks for using Sagacity,"
echo "                 Gabriel Falcao (http://github.com/gabrielfacao)"
