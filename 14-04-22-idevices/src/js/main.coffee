$ ->
  $ '#toggle-device'
    .on 'change', ->
      val = $(this).val()
      if val
        $ '#idevice'
          .removeClass().addClass val