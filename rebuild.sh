#!/bin/bash
#
# This command expects to be run within the Lucas profile directory.
#
# To use this command you must have `drush make`, `cvs` and `git` installed.
#

if [ -f lucas.make ]; then
  echo -e "\nThis command can be used to run lucas.make in place."
  echo "  [1] Rebuild Lucas in place."
  echo "  [2] [BROKEN!!] Build a full Lucas distribution (tarball that includes core)"
  echo -e "Selection: \c"
  read SELECTION

  if [ $SELECTION = "1" ]; then

    # Run lucas.make only.
    echo "Building Lucas install profile..."
    drush make --working-copy --no-core --contrib-destination=. lucas.make

  elif [ $SELECTION = "2" ]; then

    # Generate a complete tar.gz of Drupal + Lucas.
    echo "Building Lucas distribution..."
    drush make --yes --tar lucas.make

  else
   echo "Invalid selection."
  fi
else
  echo 'Could not locate file "lucas.make"'
fi
