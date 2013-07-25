###!
 * boot
###


RONPA = 'それは違うよ！！'
LINK = PACKED_HTML['link.html']

ronpaFill = (selector) ->
  area = null
  util.pollUntil 100, (-> area = $(selector).filter(':visible')[0]), ->
    area.value = RONPA + area.value
    util.setCaretPosition area, RONPA.length

ronpaOne = (el) ->
  for {sel_a, sel_area} in ronpas
    if a = el.querySelector sel_a
      return do (el, a, sel_area) ->
        $(LINK).appendTo(el).click ->
          a.click()
          ronpaFill sel_area
        el.classList.add('ronpa')
        return true
  return false

ronpaAll = ->
  $('.legend:not(.ronpa)').each(-> ronpaOne @ ; return)

# selector gala
ronpas = [
  {
    sel_a: "a.share_new_ui"
    sel_area: "#mini_statusInput"
  }
  {
    sel_a: "a.share_new"
    sel_area: "#sharer_popup_message"
  }
]

$ ->
  #kisume = Kisume window, {coffee: true}, ->
    #kisume.set 'ronpa', [], {
    #}, (err) ->
      #if err?
        #console.error "ronpa: kisume"
        #console.error err
        #return
      iid = setInterval ronpaAll, 500
