!!! 5
html
  head
    title Tabelle
    meta(charset='utf-8')
  body
    form#neuer_eintrag(method='post', name='neuer_eintrag', action='/tabelle.html')
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
          td
            input#name(name='name', type='text')
          td
            input#menge(name='menge', type='text')
          td
            input#rebsorte(type='text', name='rebsorte')
          td
            select#qualitaet(name='qulität', size='1')
              option(value='QW') Qualitätswein
              option(value='SP') Spätlese 
              option(value='AL') Auslese
              option(value='BA') Beerenauslese
              option(value='KA') Kabinett
              option(value='EW') Eiswein
              option(value='TA') Trockenbeerenauslese
              option(value='RH') Riesling Hochgewächs
          td
            select#einstufung(name='einstufung', size='1')
              option(value='Qualitätswein') Qualitätswein
              option(value='Landwein') Landwein 
              option(value='Deutscher Wein') Deutscher Wein
              option(value='Grundwein') Grundwein
              option(disabled='disabled') ------------
              option(value='Erntemenge') Erntemenge
              option(value='Destilationsmenge') Destilationsmenge
          td
            input#tank(name='textfield', type='text', maxlength='2')
      hr
      input(name='eintragen', type='submit', value='Eintragen')
