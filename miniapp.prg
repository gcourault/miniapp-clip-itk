#include "supmenu.ch"
external isinlook
external isnotdup
*====== menu globals========*

MENU INIT ;
  WINDOW DIMS 0,0,24,79 FRAME "ÚÄ¿³ÙÄÀ³ ";
  MESSAGE  MCENTER ;
  TITLE TEXT "MiniAppp Clip"  TCENTER 
MENU BARPAD 2
MENU MOUSE EXIT AT 0,2 TEXT "[þ]" COLOR "N/W"
MENU FORCE DROP .t.
MENU BOXES FRAME "ÚÄ¿³ÙÄÀ³ " OVER 1 DOWN 1;
  PADLEFT 1 PADRIGHT 1 CROSSBAR "Ã","Ä","´"
MENU COLORS SELECTED "W/N","W+/N" UNSELECTED "N/W","W+/W";
  INACTIVE "N+/W" WINDOW "W+/B   " MSG "N/G    ";
  BOXES "N/W" TITLE "W+/G   "


*====== menu structure======*

   BAROPTION "Archivos" ID "archivos" KEY 289 COLUMN 2;
      MESSAGE "Archivos del Sistema"
     DROPSTART DOWN 1 OVER 0
     BOXOPTION "Socios      " ID "socios";
        MESSAGE "Acceder a la tabla de socios"
     BOXOPTION "Localidades " ID "localidades";
        MESSAGE "Acceder a la tabla de localidades"
     BOXOPTION "S~alir       " ID "salir";
        MESSAGE "Salir al sistema operativo"
     DROPEND

*====== menu handling=====*

* (Note: mymenu should be renamed and declared LOCAL)

mymenu := MENU WRAP
set date french
set delete on
set excl off
set bell off
set cent on

initsup()
do compro

MENU SHOW mymenu
DO WHILE .T.
  MENU DO mymenu 
  do case   
  case MENU EXIT REQUEST
  case MENU EXCEPTION
  case MENU ACTION REQUEST
    do case   
    case MENU ACTION ID == "socios" && Socios      
	 	menu hide mymenu 
	 	socios()
		menu show mymenu
    case MENU ACTION ID == "localidades" && Localidades 
                localidad()
    case MENU ACTION ID == "salir" && Salir       
	 	if messyn("¨Realmente quiere salir?" )
			clear
			exit
		endif
     endcase
  endcase
ENDDO       
MENU HIDE  mymenu
