# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
((i, s, o, g, r, a, m) ->
  i["GoogleAnalyticsObject"] = r

  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date()

  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]

  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
) window, document, "script", "//www.google-analytics.com/analytics.js", "ga"
ga "create", "UA-50566096-1", "seiyoku.herokuapp.com"
ga "send", "pageview"
