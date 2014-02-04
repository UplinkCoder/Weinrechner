!!! 5
html
  head
    title Tabelle
    meta(charset='utf-8')

  body
    script(src='static/TableHandler.js', language='javascript', type='application/javascript')
    form#neuer_eintrag(method='post', name='neuer_eintrag', action='/tabelle.html')
      table#Winetable(border='1', title='Wines')
        caption Weine in Datenbank
        tr#captions
          -foreach(fieldName;FieldNames)
            th(scope='col') #{fieldName}
        
        script(type='text/javascript')
          fetchWines();

        tr
          include #{InputForm}
      hr
      input(type='submit', value='Wein Hinzufügen')