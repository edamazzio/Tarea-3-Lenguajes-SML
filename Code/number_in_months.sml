
(*toma una lista de fechas y un mes (el mes
sería un int) y retorna un número que indica cuántas fechas están en el mes dado*)
fun number_in_month (date: (int*int*int) list, month: int) =
    if null date
    then 0
    else if #2 (hd(date))=month
    then 1 + number_in_month((tl date),month)
    else number_in_month((tl date),month)


(*toma una lista de fechas y una lista de
<<<<<<< HEAD
meses (una lista de enteros) y retorna un int que indica el numero de fechas que estan en
cualquiera de los meses en la lista de meses. (Nota: use la funcion del problema anterior).
Testing = val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]);
resp = 3 
*)


fun number_in_month (date: (int*int*int) list, month: int) = 
    if null date
    then 0
    else if #2 (hd(date))=month
    then 1 + number_in_month((tl date),month)
    else number_in_month((tl date),month)


fun number_in_months (date: (int*int*int) list, month: int list) = 
    if null month
    then 0
    else number_in_month(date, hd(month))
=======
meses (una lista de enteros) y retorna un int que indica el número de fechas que están en
cualquiera de los meses en la lista de meses. (Nota: use la función del problema anterior).*)

fun number_in_months (date: (int*int*int) list, month: int list) =
    if null month
    then 0
    else number_in_month(date, hd(month)) + number_in_months(date, tl(month))
>>>>>>> ba5683dec4cf3c83ac00cd8605fdfbdc0c0c5190
