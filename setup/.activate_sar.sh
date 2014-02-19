
# # run system activity accounting tool every 10 minutes
# */10 * * * * root /usr/lib/sa/sa1 1 1
# # generate a daily summary of process accounting at 23:53
# 53 23 * * * root /usr/lib/sa/sa2 -A


# STILL NOT WORKING. NEED TO DEBUG
echo "STILL NOT WORKING. NEED TO DEBUG"

# cat <<EOF>/Library/LaunchDaemons/net.jeannotte.sa.10min.plist
# <?xml version="1.0" encoding="UTF-8"?>
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0">
# <dict>
#     <key>Label</key>
#     <string>net.jeannotte.sa.10min</string>
#     <key>ProgramArguments</key>
#     <array>
#         <string>/usr/lib/sa/sa1</string>
#         <string>1</string>
#         <string>1</string>
#     </array>
#     <key>StartInterval</key>
#     <integer>600</integer>
# </dict>
# </plist>
# EOF
# launchctl load /Library/LaunchDaemons/net.jeannotte.sa.10min.plist