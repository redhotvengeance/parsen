serialize = (obj, prefix) ->
  str = []

  for p, v of obj
    k = if prefix then prefix + "[" + p + "]" else p

    if typeof v == "object"
      str.push(serialize(v, k))
    else
      str.push(encodeURIComponent(k) + "=" + encodeURIComponent(v))

  str.join("&")

module.exports.serialize = serialize
