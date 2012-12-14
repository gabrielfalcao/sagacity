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

if [ ! -e "$DESTINATION" ]; then
    git clone -q git://github.com/gabrielfalcao/sagacity.git $DESTINATION
fi;

if ! grep -qc "$DESTINATION/setup.sh" $HOME/.bash_profile; then
    echo "source $DESTINATION/setup.sh" >> $HOME/.bash_profile
    echo "Sagacity is now active for the next bash sessions."
else
    echo "It looks like Sagacity is already installed."
fi

echo "source '$DESTINATION/setup.sh' now and start enjoying sagacity."
echo
echo "Thanks for using Sagacity,"
echo "                 Gabriel Falcao (http://github.com/gabrielfacao)"
