﻿!!!5
html
  head
    title Tabelle
    meta(charset='utf-8')
  body
    form#neuer_eintrag(method='post', name='neuer_eintrag', target='_self')
      table#tablle(border='1', title='Wines')
        caption
          | Weine in Datenbank
        tr#captions
          -foreach(fieldName;FieldNames)
            th(scope='col') #{fieldName}
        
        -foreach(wine;wines)
          tr
            -auto tuple = wine.tupleof;
              -foreach (col;tuple)
                td #{col}
        tr
          include #{InputForm}
      hr
      input(name='eintragen', type='submit', value='Eintragen')