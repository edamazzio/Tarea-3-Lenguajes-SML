(*toma una fecha y retorna un string de la forma
Enero 20, 2015 (por ejemplo). Use el operador ^ para concatenar strings y la función
Int.toString de la biblioteca de SML para convertir un int a string. Para producir la parte
del mes, no use un montón de condicionales; en su lugar, use una lista con 12 strings y la
función que se utilizó en el problema anterior. Por consistencia, ponga una coma después
del día y los meses con su inicial mayúscula: Enero, Febrero, etc*)


fun date_to_string (date: (int*int*int)) =
    let val months = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Setiembre","Octubre"
		           ,"Noviembre","Diciembre"]
	in
	(get_nth(months,#2 date) ^ " " ^ (Int.toString (#3 date)) ^ ", " ^ (Int.toString(#1 date)))
    end
