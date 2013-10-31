#= require application
#= require jquery.mockjax
#= require mocha_adapter


EmberApp.setupForTesting()
Ember.Test.adapter = Ember.Test.MochaAdapter.create()
EmberApp.injectTestHelpers()

window.stubAjax = (type, url, json) ->
  $.mockjax
    url: url
    type: type
    dataType: "json"
    responseText: json

$.mockjaxSettings.responseTime = 0
