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


# ansi color codes
SAGACITY_ANSI_GRAY="30m";
SAGACITY_ANSI_RED="31m";
SAGACITY_ANSI_GREEN="32m";
SAGACITY_ANSI_YELLOW="33m";
SAGACITY_ANSI_BLUE="34m";
SAGACITY_ANSI_PURPLE="35m";
SAGACITY_ANSI_CYAN="36m";
SAGACITY_ANSI_WHITE="37m";

# ansi instructions
SAGACITY_ANSI_NC="\033[0m";
SAGACITY_ANSI_BRIGHT="\033[1;";
SAGACITY_ANSI_DARK="\033[0;";

# aliases
SAGACITY_ANSI_GREY=$SAGACITY_ANSI_GRAY
SAGACITY_ANSI_NOCOLOR=$SAGACITY_ANSI_NC


sagacity.ansi.echo() {
    printf "\r$@$SAGACITY_ANSI_NC\n";
}

sagacity.ansi.print.bright() {
    printf "$SAGACITY_ANSI_BRIGHT$@$SAGACITY_ANSI_NC";
}

sagacity.ansi.print.dark() {
    printf "$SAGACITY_ANSI_DARK$@$SAGACITY_ANSI_NC";
}

sagacity.ansi.print() {
    sagacity.ansi.print.bright "$@"
}

sagacity.ansi.dark.gray () { sagacity.ansi.print.dark "$SAGACITY_ANSI_GRAY$@"; }
sagacity.ansi.dark.red () { sagacity.ansi.print.dark "$SAGACITY_ANSI_RED$@"; }
sagacity.ansi.dark.green () { sagacity.ansi.print.dark "$SAGACITY_ANSI_GREEN$@"; }
sagacity.ansi.dark.yellow () { sagacity.ansi.print.dark "$SAGACITY_ANSI_YELLOW$@"; }
sagacity.ansi.dark.blue () { sagacity.ansi.print.dark "$SAGACITY_ANSI_BLUE$@"; }
sagacity.ansi.dark.purple () { sagacity.ansi.print.dark "$SAGACITY_ANSI_PURPLE$@"; }
sagacity.ansi.dark.cyan () { sagacity.ansi.print.dark "$SAGACITY_ANSI_CYAN$@"; }
sagacity.ansi.dark.white () { sagacity.ansi.print.dark "$SAGACITY_ANSI_WHITE$@"; }


sagacity.ansi.bright.gray () { sagacity.ansi.print.bright "$SAGACITY_ANSI_GRAY$@"; }
sagacity.ansi.bright.red () { sagacity.ansi.print.bright "$SAGACITY_ANSI_RED$@"; }
sagacity.ansi.bright.green () { sagacity.ansi.print.bright "$SAGACITY_ANSI_GREEN$@"; }
sagacity.ansi.bright.yellow () { sagacity.ansi.print.bright "$SAGACITY_ANSI_YELLOW$@"; }
sagacity.ansi.bright.blue () { sagacity.ansi.print.bright "$SAGACITY_ANSI_BLUE$@"; }
sagacity.ansi.bright.purple () { sagacity.ansi.print.bright "$SAGACITY_ANSI_PURPLE$@"; }
sagacity.ansi.bright.cyan () { sagacity.ansi.print.bright "$SAGACITY_ANSI_CYAN$@"; }
sagacity.ansi.bright.white () { sagacity.ansi.print.bright "$SAGACITY_ANSI_WHITE$@"; }


sagacity.ansi.gray () { sagacity.ansi.print "$SAGACITY_ANSI_GRAY$@"; }
sagacity.ansi.red () { sagacity.ansi.print "$SAGACITY_ANSI_RED$@"; }
sagacity.ansi.green () { sagacity.ansi.print "$SAGACITY_ANSI_GREEN$@"; }
sagacity.ansi.yellow () { sagacity.ansi.print "$SAGACITY_ANSI_YELLOW$@"; }
sagacity.ansi.blue () { sagacity.ansi.print "$SAGACITY_ANSI_BLUE$@"; }
sagacity.ansi.purple () { sagacity.ansi.print "$SAGACITY_ANSI_PURPLE$@"; }
sagacity.ansi.cyan () { sagacity.ansi.print "$SAGACITY_ANSI_CYAN$@"; }
sagacity.ansi.white () { sagacity.ansi.print "$SAGACITY_ANSI_WHITE$@"; }
