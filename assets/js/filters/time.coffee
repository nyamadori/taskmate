module.exports = (time) ->
  if time
    moment.duration(time).humanize()
  else
    ''