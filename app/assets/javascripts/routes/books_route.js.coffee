EmberApp.BooksRoute = Ember.Route.extend

  model: -> EmberApp.Book.find()
