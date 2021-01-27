# include "inkey.ch"
/*
------------------------
   Archivos del Sistema
------------------------
*/
function socios
set delete on
select 1
if snet_use("localidad","loc", .f. , 5 , .f. )
	set index to codloc
else
	msg("No se pudo abrir la base de datos LOCALIDADES")
	return NIL
endif

select 4
if snet_use("socios","soc", .f. , 5 , .f. )
        set index to codsoc, nomsoc
else
	msg("No se pudo abrir la base de datos SOCIOS")
	return NIL
endif
set relation to localidad into loc 

set key K_F4 to ultimo

aCampo := {}
aDesc  := {}
aPict  := {}
aVal   := {}
aLook  := {}
aEdit  := {}

aadd( aCampo , "soc->codigo" )
aadd( aDesc  , "N§ Socio <F4>" )
aadd( aPict , "@9" )
aadd( aVal , "isnotdup( @@ , 1 , nil , .f. , recno() , nil ); Registro duplicado o en blanco" )
aadd( aLook , "" )
aadd( aEdit , .t. )

aadd( aCampo , "soc->nombre" )
aadd( aDesc  , "Apellido y Nombre" )
aadd( aPict  , "@S35" )
aadd( aVal , "" )
aadd( aLook , "" )
aadd( aEdit , .t. )



aadd( aCampo , "soc->direccion" )
aadd( aDesc , "Direccion" )
aadd( aPict , "@S35" )
aadd( aVal , "" )
aadd( aLook , "" )
aadd( aEdit , .t. )

aadd( aCampo , "soc->localidad" )
aadd( aDesc , "Localidad" )
aadd( aPict , "@9" )
aadd( aVal , "isinlook( @@ , 1 , NIL , .f. , NIL ) ; No se encontr¢ la Localidads" ) 
aadd( aLook ,  "NOMBRE;Localidades;loc;CODIGO" )
aadd( aEdit , .t. )

aadd( aCampo , "loc->nombre" )
aadd( aDesc , "" )
aadd( aPict , "@x" )
aadd( aVal , ""  )
aadd( aLook , "" )
aadd( aEdit , .f. )



viewport( .t. , aCampo , aDesc , aPict , aVal , aLook , NIL , aEdit , .f. )
set key K_F4 to
return NIL

proc ultimo
parameters p1, p2, p3
* cIndice := order()
nRec := recno()
set order to 1
go bottom
cNumero := alltrim( str(  soc->codigo  + 1 ) ) 
* set order to &cIndice
goto nRec
keyboard cNumero
return NIL


function localidad()
select 2 
set delete on
if snet_use("localidad","loc1", .f. , 5 , .f. )
	set index to codloc
else
	msg("No se pudo abrir la base de datos LOCALIDADES")
	return NIL
endif
editdb( .t. , nil ,nil , .t. )

return NIL

