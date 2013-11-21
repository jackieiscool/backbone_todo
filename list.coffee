class ListView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    
    #Pass variables in using Underscore.js Template
    variables = list_label: "My List"
    
    # Compile the template using underscore
    template = _.template($("#list_template").html(), variables)
    
    # Load the compiled HTML into the Backbone "el"
    @$el.html template

  events:
    "click input[type=button]": "addTodo"

  addTodo: (event) ->
    # Button clicked, you can access the element that was clicked with event.currentTarget
    # alert "Added Todo " + $("#list_input").val()
    todo = $("#list_input").val()
    $("#todo_container").append(new TodoView(todo: todo).render())

list_view = new ListView (el: $("#list_container"))

class TodoView extends Backbone.View

  initialize: (attrs) ->
    @options = attrs
    @render

  render: ->
    variables = todoItem: @options.todo
    template = _.template($("#todo_template").html(), variables)

    @$el.html template

  events:
    "click input[type=checkbox]": "markComplete"

  markComplete: (event) ->
    alert "completed"
    @$el.css("text-decoration", "line-through")
