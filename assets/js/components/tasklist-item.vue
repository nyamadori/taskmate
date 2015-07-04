<script lang="coffee">
module.exports =
  replace: true
  mixins: [require('../mixins/task')]
</script>

<template>
  <a v-if="!isEdit" v-on="click: selected" href="#" class="list-group-item">
    <span v-if="endDate" class="badge">終了: {{endDate | date}}</span>
    <span v-if="startDate" class="badge">開始: {{startDate | date}}</span>
    {{task.name}}
  </a>

  <div v-if="isEdit">
    <taskmate-task-edit task='{{task}}'></taskmate-task-edit>
  </div>
</template>

<style lang="stylus">

</style>