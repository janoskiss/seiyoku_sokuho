# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  IMG_NUM_MIN = 1
  IMG_NUM_MAX = 30
  THRESHOLD_IMG_NUM = IMG_NUM_MAX + 1
  INCREMENT_NUM = 1
  REG_IMG_URL = /\d+\.jpg$/
  INTERVAL_TIME = 400
  ATTR_SRC = 'src'
  EXTENSION_JPEG = '.jpg'

  element = null
  initialUrl = ''
  baseUrl = ''
  index = IMG_NUM_MIN
  timerId = null

  animThumbnail = ->
    element.attr ATTR_SRC,(baseUrl + index + EXTENSION_JPEG)
    index = (index + INCREMENT_NUM) % (THRESHOLD_IMG_NUM)
    index = if index < IMG_NUM_MIN then IMG_NUM_MIN else index
  getBaseUrl = (imgUrl) -> imgUrl.replace REG_IMG_URL,''

  $('a.thumbnail > img').hover ->
    element = $(@)
    initialUrl = element.attr ATTR_SRC
    baseUrl = getBaseUrl initialUrl
    index = IMG_NUM_MIN
    timerId = setInterval animThumbnail,INTERVAL_TIME
  , ->
    clearInterval timerId
    element.attr ATTR_SRC,initialUrl
