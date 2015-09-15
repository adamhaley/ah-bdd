#!/bin/sh

echo "Starting PhantomJS..."

# Kill PhantomJS in case it happens to be running
killall phantomjs

# Start PhantomJS in the background, and suppress its output
phantomjs --webdriver=4444 > /dev/null 2>&1 &

# Wait for PhantomJS to be ready; do this by checking for port 4444 to be open
# First give it 1 second before we even start checking, to avoid unnecessary errors echoing to the user
sleep 1

# Now poll every second to check for port 4444 to be open
for i in 1 2 3 4 5 6 7 8 9; do bash -c "echo > /dev/tcp/localhost/4444" && break || sleep 1; done


echo "Starting Cucumber.js..."
./node_modules/.bin/cucumber-js --tags @startup


echo "Stopping PhantomJS..."
# `$!` is a special symbal that refers to the most recently started background task
kill $!
