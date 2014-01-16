!!! 5
html
  head
    title Tabelle
    meta(charset='utf-8')
  body
    table#tablle(border='1', title='Wines', summary='Tabelle der eingetragenen Weine')
      caption
        | Weine in Datenbank
      tr
        th(scope='col') Name
        th(scope='col') Menge
        th(scope='col') Sorte
        th(scope='col') Qualitaet
        th(scope='col') Einstufung
        th(scope='col') Tank
      
      -foreach(wine;wines) with (wine)
        tr
          td a(href='tabelle.html?edit=#{name}') #{name}
          td #{amount} L
          td #{quality}
          td #{grouping}
          td #{tank}
		  
      form#add_form(name='add', method='post', action='_self')
        tr
          td
            input#name(name='name', type='text')
          td
            input#menge(name='menge', type='text')
          td
            input#rebsorte(type='text', name='rebsorte')
          td
            select#qualitaet(name='qualitaet', size='1')
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
              option(value='QW') Qualitätswein
              option(value='LW') Landwein 
              option(value='AL') Deutscher Wein
              option(value='BA') Grundwein
              option(value='--') ------------
              option(value='EM') Erntemenge
              option(value='DM') Destilationsmenge
          td
            input#tank(name='textfield', type='text', maxlength='2')
