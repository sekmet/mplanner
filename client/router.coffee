Router.configure
	layoutTemplate: "layout"

@AdminController = RouteController.extend
  before: ->
    if Meteor.loggingIn()
      @render 'loading'
      return @stop()
    else
      if Meteor.user()
        unless Meteor.user().profile.type
          return @redirect 'profile'
        else
      else
        return @redirect 'entrySignIn'

Router.map ->
  @route 'home',
    path: '/'
    before: ->
      if Meteor.loggingIn()
        @render 'loading'
        return @stop()
      else
        if Meteor.user()
          return @redirect 'dashboard'

  @route 'sponsors'

  @route 'dashboard',
    controller: 'AdminController'

  @route 'profile',
    data: -> Meteor.user()
    before: ->
      if Meteor.loggingIn()
        @render 'loading'
        return @stop()
      else
        unless Meteor.user()
          return @redirect 'entrySignIn'

