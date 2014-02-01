developer-scorecard
===================

an app that people can authenticate with and then get all their information out very easily

I'd basically like to have a customizable and embeddable scorecord.

Similar data to http://osrc.dfm.io/blairanderson but be embeddable. I like people like to see better stats about themselves, and would like to share it around the internet. 

## Getting Started

#### ENV vars

`GITHUB_APP_ID`

`GITHUB_APP_SECRET`


###Ember tips

#### 1. Start At the Router

  `@route("user", path: "/" )` will go to the user_route.js 

I think of the user_route as a `before_filter` to the controllers.

Inside the `user_route.js`
