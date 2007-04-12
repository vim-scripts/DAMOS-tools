" Vim syntax file
" Language:	damos Kenngroessen Beschreibungs Datei
" Maintainer:	Stefan Liebl <S.Liebl@gmx.de>
" URL:		
" Credits:	

" load c-syntax
execute('source ' . $VIMRUNTIME . '/syntax/c.vim')

"syntax keyword kgsFunctions sg_funktion contained
syntax keyword kgsFunctions     sg_funktion variante revision
syntax keyword kgsDefinitions   fkt_bezeichner kgs_bezeichner ram_bezeichner
syntax keyword kgsDefinitions   ram_groesse lok_ram_groesse kennwert kennlinie
syntax keyword kgsDefinitions   gruppenkennlinie gruppenkennfeld gruppenstuetzstellen
syntax keyword kgsDefinitions   kennfeld kennwerteblock systemkonstante
syntax keyword kgsRefgroessen   ref_ram_groesse ref_kenngroesse
syntax keyword kgsKomponents    umrechnung codesyntax datentyp adressierschema
syntax keyword kgsKomponents    bitanzahl element_anzahl bitbasis_typ bitposition
syntax keyword kgsKomponents    bitbasis_name init_wert init_wertp minp_w maxp_w
syntax keyword kgsKomponents    ablageschema umrechnung anzahl min_w max_w
syntax keyword kgsKomponents    test_wert test_wertp test_wert_text nicht_im_eprom
syntax keyword kgsKomponents    eingangsgroesse_x eingangsgroesse_y ergebnisgroesse
syntax keyword kgsKomponents    anzahl_stuetzstellen_x anzahl_stuetzstellen_y
syntax keyword kgsKomponents    test_stuetzstellen_x test_stuetzstellen_y
syntax keyword kgsKomponents    anzahl_test_stuetzstellen_x anzahl_test_stuetzstellen_y
syntax keyword kgsKomponents    gruppenstuetzstellen_x gruppenstuetzstellen_y
syntax keyword kgsKomponents    minp_x minp_y maxp_x maxp_y
syntax keyword kgsKomponents    test_stuetzstellenp_x test_stuetzstellenp_y
syntax keyword kgsKomponents    nicht_applizierbar
syntax keyword kgsKomponents    deutsch


highlight def link kgsFunctions Function
highlight def link kgsDefinitions Function
highlight def link kgsRefgroessen Function
highlight def link kgsKomponents Type
