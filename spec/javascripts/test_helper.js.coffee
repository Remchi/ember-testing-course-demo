#= require application
#= require mocha_adapter


EmberApp.setupForTesting()
Ember.Test.adapter = Ember.Test.MochaAdapter.create()
EmberApp.injectTestHelpers()
