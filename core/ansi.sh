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

SAGACITY_ANSI_GREY="\033[1;30m";
SAGACITY_ANSI_RED="\033[1;31m";
SAGACITY_ANSI_GREEN="\033[1;32m";
SAGACITY_ANSI_YELLOW="\033[1;33m";
SAGACITY_ANSI_WHITE="\033[1;37m";
SAGACITY_ANSI_NC="\033[0m";

sagacity.ansi.print() {
    printf "$@$SAGACITY_ANSI_NC";
}

sagacity.ansi.red () { sagacity.ansi.print "$SAGACITY_ANSI_RED$@"; }
sagacity.ansi.green () { sagacity.ansi.print "$SAGACITY_ANSI_GREEN$@"; }
sagacity.ansi.yellow () { sagacity.ansi.print "$SAGACITY_ANSI_YELLOW$@"; }
sagacity.ansi.white () { sagacity.ansi.print "$SAGACITY_ANSI_WHITE$@"; }
sagacity.ansi.gray () { sagacity.ansi.print "$SAGACITY_ANSI_GRAY$@"; }
