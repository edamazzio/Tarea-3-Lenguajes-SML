(*toma una lista de fechas y un mes (el mes
seria un int) y retorna un numero que indica cuantas fechas estan en el mes dado
Testing = val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2);
resp = 1
*)

fun number_in_month (date: (int*int*int) list, month:int) = 
    if null date
    then 0
    else if #2 (hd(date))=month
    then 1 + number_in_month((tl date),month)
    else number_in_month((tl date),month)
 
 
 