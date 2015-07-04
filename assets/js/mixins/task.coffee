module.exports =
  props: ['task']

  data: ->
    task: null
    isEdit: false
    isStart: false
    timer: null
    currentTime: 0

  computed:
    currentActivity: ->
      @task.activities[@task.activities.length - 1]

    startDate: ->
      @currentActivity?.startDate

    endDate: ->
      @currentActivity?.endDate

    totalTime: ->
      @task.activities
      _(@task.activities).sum (act) ->
        if act.endDate
          act.endDate.getTime() - act.startDate.getTime()
        else
          0

  events:
    'taskedit': (task) ->
      @isEdit = false

    'hook:created': ->
      endDate = (@endDate || new Date).getTime()

      @timer = setInterval =>
          if @currentActivity?.startDate
            @currentTime = endDate - @currentActivity.startDate.getTime()
      , 1000

    'hook:beforeDestroy': ->
      clearInterval(@timer)

  methods:
    createActivity: ->
      startDate: null
      endDate: null

    start: (e) ->
      @task.activities.push(@createActivity())
      @currentActivity.startDate = new Date
      @isStart = true
      e.preventDefault()

    stop: (e) ->
      @currentActivity.endDate = new Date
      @isStart = false
      e.preventDefault()

    edit: (e) ->
      @isEdit = true
      e.preventDefault()

    delete: (e) ->
      @$dispatch 'taskdelete', @$index

    selected: (e) ->
      @$dispatch 'taskselected', @$index
      e.preventDefault()