moment.locale(navigator.language)

new Vue
  el: 'body'

  data:
    tasks: []
    selectedTask: null

  events:
    'taskselected': (index) ->
      @selectedTask = @tasks[index]

  components: require './components'
  filters: require './filters'