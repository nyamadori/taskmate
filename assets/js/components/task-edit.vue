<script lang="coffee">
module.exports =
  mixins: [require('../mixins/task')]

  methods:
    create: (e) ->
      @$dispatch 'taskcreate', @task
      e.preventDefault()

    edit: (e) ->
      @$dispatch 'taskedit', @task
      e.preventDefault()
</script>

<template>
  <div class="list-group-item">
    <form v-if="task.newTask" v-on="submit: create">
      <label class="control-label sr-only" for="task-name">Jobの名前</label>
      <input v-model="task.name" id="task-name" class="form-control" type="text" placeholder="Jobの名前を入力してEnter (Return) キーで追加">
    </form>

    <form v-if="!task.newTask" v-on="submit: edit">
      <div class="form-group">
        <label for="task-name">Jobの名前</label>
        <input v-model="task.name" type="text" class="form-control" id="task-name">
      </div>

      <div class="form-group">
        <a v-if="!isStart" v-on="click: start" href="#" class="btn btn-primary">作業開始</a>
        <a v-if="isStart" v-on="click: stop" href="#" class="btn btn-primary">作業終了</a>
      </div>

      <div class="form-group">
        <label for="task-name">累計作業時間</label>
        <p class="form-control-static">{{currentTime | time}}</p>
      </div>
    </form>
  </div>
</template>