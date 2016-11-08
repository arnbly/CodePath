## Tumblr

The purpose of this homework is to leverage animations and gestures to create custom navigation. We're going to use the techniques from this week to implement some interactions in Tumblr.

Time spent: `<8>`

### Features

#### Required

- [x] Tapping on Home, Search, Account, or Trending should show the respective screen and highlight the tab bar button.
- [x] Compose button should modally present the compose screen.

#### Optional

- [x] Compose screen is faded in while the buttons animate in.
- [x] Login button should show animate the login form over the view controller.
- [ ] Discover bubble should bob up and down unless the SearchViewController is tapped.

#### The following **additional** features are implemented:

- [x] Loader triggers in between navigation control screens
- [x] Compose screen buttons animate out
- [x] Fade out and dismiss keyboard when canceling log-in

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Issues getting the log in screen to display semi-transparently over previous screen
2. Is there a better, more condensed way, to implement cascading animations. 
3. Is there an efficient way to make sure animations play before dismissing a view controller? I had to wrap my dismiss action in a delayed animation block. 

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
1. Issues getting the log in screen to display semi-transparently over previous screen

* Any libraries or borrowed content.