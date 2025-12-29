#
# This script should be run whenever needed after pulling dotfiles updates. It must be idempotent.
#

# Copy Rectangle config to the spot where Rectangle looks for it on startup -- see:
# https://github.com/rxhanson/Rectangle/blob/6adf9c318ba4b92bfa9392bf4c3a1dacebde8bc2/README.md#import--export-json-config
mkdir -p "$HOME/Library/Application Support/Rectangle"
cp RectangleConfig.json "$HOME/Library/Application Support/Rectangle/RectangleConfig.json"
echo "Please restart Rectangle if it is running"
