!!! transitional
html
  head
    title Tabelle
  body
    table#tablle(border='1', title='Wines', summary='Tabelle der eingetragenen Weine')
      caption
        | Weine in Datenbank
      tr
        th(scope='col') Name
        th(scope='col') Menge
        th(scope='col') Qualitaet
        th(scope='col') Einstufung
        th(scope='col') Tank
      -foreach(wine;wines) with(wine)
      tr
        td= name
        td= amount L
        td= quality
        td= grouping
        td= tank
      
      tr
        td
          a(href='tabelle.html?edit=TestWein2') TestWein2
        td  50 L
        td Landwein
        td Landwein
        td 2
