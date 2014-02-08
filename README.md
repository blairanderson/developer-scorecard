developer-scorecard
===================

an app that people can authenticate with and then get all their information out very easily

I'd basically like to have a customizable and embeddable scorecord.

Similar data to http://osrc.dfm.io/blairanderson but be embeddable. I like people like to see better stats about themselves, and would like to share it around the internet. 

[ ] we help people make APIs out of their applications. People authenticate and we look at their applications. We look at the routes files, we read the routes files. Then we read which controllers to hit, and we consider those routes to be "possible" endpoints. 

We let people add/remove from the list with basic markup.

```ruby

	x <--- /users 			#Users#new
	x <--- /users 			#Users#index
	x ---> /users 			#Users#create
	x <--- /users/:id		#Users#show
	x <--- /users/:id/edit #Users#edit
	x ---> /users/:id		#USers#update
	XxxxxX /users/:id		#Users#destroy
	
	
```


## Getting Started

#### ENV vars

`GITHUB_APP_ID`

`GITHUB_APP_SECRET`


###Ember tips

__Before anything, get the [Ember Inspector chrome browser extension](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi?hl=en)__

Ok so start the server and open the ember inspector. Show the available routes and controllers that can be overwritten. 

#### 1. Start At the Router

On your first ember app, use a generator. It will help you instantly have the skeleton of an ember app. It comes with empty folders that follow conventions. Conventions help more people easily understand your code, because they know the conventions of your code, and can easily jump in to help. The more you follow good conventions, the more happy people will to be writing code in your application. It can get huge, but conventions should redirect as supply meets demand. 


  `@route("user", path: "/" )` will go to the user_route.js 

I think of the user_route as a `before_filter` to the controllers.

Inside the `user_route.js`
