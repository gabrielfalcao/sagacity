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

# WELCOME TO SAGACITY
#
# Sagacity is a set of "dotfiles" for the Mac OS X of a sagacious
# coder.
#
# Among its features it includes:
#
#   Dropbox backup of projects
#   ==========================
#
#   * Leveraging a project structure divided within categories "work",
#     "personal" and "3rdparty".
#
#   * All the projects are backed up by Dropbox: Imagine your git
#     repositories being backed up instantaniously in the cloud ? No
#     more chaos when you accidentally "git reset --hard" on the code
#     you've been working in the past hours.
#
#   * Go to your dropbox account and recover any "deleted" files and
#     you're safe :)
#
#
#
#   Virtualenv hooks for grown ups
#   ==============================
#
#   * If you are hacking Python C extensions you might want to link
#     your module with some of your handmade shared libraries.
#
#   * SAGACITY will `unset` your DYLD_LIBRARY_PATH before


# Prelude
#
# Inside sagacity's directory there are many files and folders
# starting with "@", it means they sort of work like templates for
# "dotfiles".


# STEP 1: discover where all the sagacity dotfiles are
export SAGACITY_MAIN=$(cd $(dirname ${BASH_SOURCE[0]:-$0}) && pwd)

export SAGACITY_PLUGINS="$SAGACITY_MAIN/plugins"
# STEP 2: load our core helpers and variables
#
# here you will find all the generic stuff that doesn't depend on
# anything too special
source $SAGACITY_MAIN/core/fs.sh
source $SAGACITY_MAIN/core/commands.sh
source $SAGACITY_MAIN/core/ansi.sh
source $SAGACITY_MAIN/core/interaction.sh
source $SAGACITY_MAIN/core/completion.sh

# STEP 3: allow the user to define his/her own sagacious extensions
export SAGACITY_CLEVER_EXTENSIONS=$HOME/.sagacity/extensions

# STEP 4: load our mainstream plugins
for src in $SAGACITY_PLUGINS/*.sh; do
    source $src
done;

# STEP 5: load user's custom extensions
if [ "$(sagacity.core.fs.file_exists '$SAGACITY_CLEVER_EXTENSIONS/*')" == "yes" ]; then
    for src in $SAGACITY_CLEVER_EXTENSIONS/*.sh; do
        source $src
    done;
fi;
