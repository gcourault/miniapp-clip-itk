/*
Compro.prg
Reconstruye las bases de datos y los indices
*/
if !file("socios.dbf")
  plswait(.t., "Creando tabla de socios")
  aDbf := {}
  aadd( aDbf , {"CODIGO", "N", 2, 0 } )
  aadd( aDbf , {"NOMBRE", "C", 30 , 0 } )
  aadd( aDbf , {"DIRECCION","C", 45 , 0 } )
  aadd( aDbf , {"LOCALIDAD","N",2,0 } )
  dbcreate("socios", aDbf )
  plswait( .f. )
endif

if !file("localidad.dbf")
  aDbf := {}
  plswait( .t. , "Creando y poblando tabla de localidades")
  aadd( aDbf , {"CODIGO", "N", 2, 0 } )
  aadd( aDbf , {"NOMBRE", "C", 30 , 0 } )
  dbcreate("localidad", aDbf )
  select 1
  use localidad
  append blank
  go bottom
  replace CODIGO with 1, NOMBRE with "SANTA FE"
  append blank
  go bottom
  replace CODIGO with 2, NOMBRE with "SANTO TOME"
  plswait( .f. )
endif

if !file("codsoc.ntx")
  plswait(.t.,  "Creando indice codigo de socios")
  select 1
  use socios 
  index on codigo to codsoc
  plswait(.f.)
endif
if !file("nomsoc.ntx")
  plswait(.t.,  "Creando indice nombre de socios")
  select 1
  use socios 
  index on nombre to nomsoc
  plswait(.f.)
endif
if !file("codloc.ntx")
  plswait(.t.,  "Creando indice codigo de localidades")
  select 1
  use localidad
  index on codigo to codloc
  plswait(.f.)
endif
close all

