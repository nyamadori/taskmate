<script lang="coffee">
module.exports =
  props: ['tasks']
  data: ->
    newTask: @createNewTask()

  events:
    'taskcreate': (task) ->
      @newTask = @createNewTask()
      task.newTask = false
      @tasks.push(task)

    'taskdelete': (index) ->
      @tasks.$remove(index)

  methods:
    createNewTask: ->
      name: ''
      activities: []
      newTask: true
</script>

<template>
<div class="list-group">
  <taskmate-tasklist-item v-repeat="task:tasks"></taskmate-tasklist-item>
  <taskmate-task-edit task="{{newTask}}"></taskmate-task-edit>
</div>
</template>