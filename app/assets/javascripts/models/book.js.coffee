EmberApp.Book = Ember.Object.extend
  title: ""
  author: ""

  save: ->
    self = this
    promise = Ember.$.post "/api/books", { title: @get('title'), author: @get('author') }
    promise.then ->
      Ember.run ->
        EmberApp.Book.books.pushObject(self)

EmberApp.Book.reopenClass
  books: []

  find: ->
    self = this
    Ember.$.getJSON "/api/books", (response) ->
      response.forEach (hash) ->
        Ember.run ->
          book = EmberApp.Book.create(hash)
          self.books.pushObject(book)
    @books
