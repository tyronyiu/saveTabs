# saveTabs
A shell script using osascript, that saves the currently open safari (or chrome) tabs to a markdown file.

The filename is the current timestamp, but can be easily changed to date+time or etc.

The markdown file contains a list of links, which are displayed as their page titles.
- It also accounts for different windows you've got open.

**Future features:**
- Change to choose safari or chrome
- Change directory of saving
- Ability to check for a pdf converter tool, to automatically make the markdown file into a pdf

Example output:

```
# Tuesday, 12. November 2019 at 16:46:03 
## Window 1: 
 - [Reddit – The frontpage of the internet](https://reddit.com) 
```
