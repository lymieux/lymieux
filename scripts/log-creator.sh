#!/bin/bash

# logs-creator.sh
#
# Ran, then prompt with DATE question, a for automatic
# or date in format of mm-dd-yy
# Then launches EDITOR and saves to DATE.md

# Date var
DATE=$(date +"%m-%d-%Y")

# Input date
echo -e $"Name: ([d]ate): \c "
read NAME
NAME=$(echo "${NAME,,}")

# check for a || A to automatically fill in date
if [ $NAME == "d" ] ; then
        NAME=$DATE
fi

# checks if file exist
FILE="0"
if [ -f "$(pwd)/$NAME.md" ] ; then
        echo -e $"Overwrite? ([y]es): \c "
        read FILE
        FILE=$(echo "${FILE,,}")
fi

# If overwrite, clears contents pastes template, and opens editor
if [ $FILE == "y" ] ; then
        rm -f "$(pwd)/$NAME.md"
fi

# Add to file if no exists
if [ ! -f "$(pwd)/$NAME.md" ] ; then
        # weird cat eot multi bug? echo it whatever
        echo "\`\`\`" >> $NAME.md
        echo "Log $DATE" >> $NAME.md
        echo "==============" >> $NAME.md
        echo "" >> $NAME.md
        echo "" >> $NAME.md
        echo "\`\`\`" >> $NAME.md
fi

$EDITOR "$(pwd)/$NAME.md"