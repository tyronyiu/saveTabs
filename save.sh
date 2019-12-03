#!/bin/bash
text=`/usr/bin/osascript << EOT
-- NAME OF REPORT TITLE

-- PREPARE THE LIST
set url_list to {}
set the date_stamp to ((the current date) as string)
set NoteTitle to "# " & the date_stamp
set report_Title to do shell script "ruby -e 'puts Time.now.to_i'"
set thePath to alias "Macintosh HD:Users:tyyiu:repos:urlLists:"

-- GET TABS FROM SAFARI
set window_count to 1
tell application "Safari"
	activate
	set safariWindow to windows
	repeat with w in safariWindow
		try
			if (tabs of w) is not {} then
				copy ("## Window " & window_count & ":" & linefeed) to the end of url_list
			end if
			repeat with t in (tabs of w)
				set TabTitle to ("- [" & name of t & "]")
				set TabURL to ("(" & URL of t & ")")
				set TabInfo to (TabTitle & TabURL & linefeed)
				copy TabInfo to the end of url_list
			end repeat
		end try
		set window_count to window_count + 1
	end repeat
end tell

-- CONVERT URL_LIST TO TEXT
set old_delim to AppleScript's text item delimiters
-- set AppleScript's text item delimiters to linefeed
set AppleScript's text item delimiters to old_delim
set url_list to (NoteTitle & linefeed & linefeed & linefeed & url_list) as text
return url_list
EOT
`
dir=~/repos/urlLists
filename=$(date +%s)
touch $dir/$filename.md
echo $text | cat > $dir/$filename.md
sed -i .bak 's/- \[/\'$'\n - \[/g' $dir/$filename.md
sed -i .bak 's/##/\'$'\n##/g' $dir/$filename.md
