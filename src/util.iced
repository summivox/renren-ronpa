###!
 * util
###

util = {}

# periodically do check until true, then callback
# from renren-markdown/src/util.iced
util.pollUntil = (period, check, cb) ->
  if check instanceof Function && cb instanceof Function
    iid = setInterval (-> if check() then cb clearInterval iid), period # pun intended

# http://stackoverflow.com/questions/512528/set-cursor-position-in-html-textbox
util.setCaretPosition = (el, pos) ->
  unless el instanceof Element then return false
  if el.createTextRange
    range = el.createTextRange()
    range.move 'character', pos
    range.select()
  else if el.selectionStart
    el.focus()
    el.setSelectionRange(pos, pos)
  else
    el.focus()
