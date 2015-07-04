module.exports = (date) ->
  return null unless date
  moment(date).calendar()