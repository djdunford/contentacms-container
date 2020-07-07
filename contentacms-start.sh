#!/usr/bin/env bash
#
# contentacms-start.sh
#
# adapted from https://raw.githubusercontent.com/contentacms/contenta_jsonapi/8.x-3.x/installer.sh
#
# adapted by Darren Dunford
#

# Start the built-in PHP server.
# shellcheck disable=SC2164
cd "$install_path/" || exit
$install_path/vendor/drush/drush/drush user-login --no-browser --uri="http://localhost:8888"
$install_path/vendor/drush/drush/drush runserver `hostname`:8888
cd "$original_wd" || exit
