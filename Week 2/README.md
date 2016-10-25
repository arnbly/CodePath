## Carousel

The purpose of this homework is to leverage views, view properties, and events to create a high fidelity prototype that is difficult to distinguish from a production app. We're going to use the techniques from this week to implement the Carousel app from the signed out state to the basic signed in state.

Time spent: `<5>`

### Features

### Required User Stories

1. Landing Screen
- [x] Static photo tiles on the initial screen.
- [x] User can scroll to reveal sign in buttons.
2. Sign In
- [x] Tapping on email/password reveals the keyboard and shifts the scroll view and Sign In button up.
- Upon tapping the Sign In button.
- [x] If the username or password fields are empty, user sees an error alert.
- [x] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
- [x] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
3. Tutorial Screens
- [x] User can page between the screens.
4. Image Timeline
- [x] Display a scrollable view of images.
- [x] User can tap on the conversations button to see the conversations screen (push).
- [x] User can tap on the profile image to see the settings view (modal from below).
5. Conversations
- [x] User can dismiss the conversations screen.
6. Settings
- [x] User can dismiss the settings screen.
- [x] User can log out.

### Optional User Stories

1. Landing Screen:  
- [ ] Photo tiles move, scale and rotate while user scrolls.
2. Sign In:
- [x] User can scroll down to dismiss keyboard.
- [x] User sees the form scale up and fade it in as the screen appears.
3. Sign up / Create a Dropbox:
- [x] Tapping in the form reveals the keyboard and scrolls the form and button up so they remain visible.
- [x] Tapping the "Agree to Terms" checkbox selects the checkbox.
- [x] Tapping on "Terms" shows a web view with the terms.
- [x] User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
4. Tutorial Screens:
- [ ] User can page between the screens with updated dots.
- [ ] Upon reaching the 4th page, the page indicator dots are hidden and "Take Carousel for a Spin" button is shown.
5. Learn more about Carousel:
- [ ] Show the "Learn more about Carousel" button in the photo timeline.
- [ ] Tap the X to dismiss the banner.
- [ ] Track the 3 events:
- (1) View a photo full screen, (2) Swipe left and right and (3) Share a photo  - Upon completion of the events, mark them green.
- [ ] When all events are completed, dismiss the banner.
6. Settings
- [ ] User is presented with an action sheet with actions to cancel or logout.


#### The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I didn't have a chance to animate the images on the intro screen. I'm curious how people went about accomplishing that. 

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<a href="https://github.com/arnbly/CodePath/blob/master/Week%201/01%20-%20Assets/AB-DropboxDemo.gif" target="_blank"><img src='https://github.com/arnbly/CodePath/blob/master/Week%201/01%20-%20Assets/AB-DropboxDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /></a>

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

Odd crashing due to a SIGBART error when running through Sign In flow > Sign Out > Create Account, or the opposite flow. 

* Any libraries or borrowed content.
