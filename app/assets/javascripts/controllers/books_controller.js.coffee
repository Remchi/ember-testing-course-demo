EmberApp.BooksController = Ember.ArrayController.extend

  newBook: (->
    {
      title: ""
      author: ""
    }
  ).property()

  actions:
    save: ->
      EmberApp.Book.create(@get('newBook')).save()
