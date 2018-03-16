(*
Instituto Tecnologico de Costa Rica
Escuela de Computacion
Lenguajes de programacion
Tarea #3 Calentando motores
Esteban Damazio
Alejandro Jimenez
*)

(*Funcion 1
toma dos fechas y retorna un booleano. El retorno es
true si el primer argumento es una fecha que está antes de la fecha del segundo
argumento. (Si ambas fechas son iguales, el retorno será false).*)

fun is_older (date1 : int*int*int, date2 : int*int*int) =
  if #1 date1 < #1 date2
  then
    true
  else
    if (#2 date1 < #2 date2) andalso (#1 date1 = #1 date2)
    then
      true
  else (#2 date1 = #2 date2) andalso (#1 date1 = #1 date2) andalso #3 date1 < #3 date2;

hd(lista)::

(*Funcion 2
toma una lista de fechas y un mes (el mes
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


(*Funcion 3
toma una lista de fechas y una lista de
meses (una lista de enteros) y retorna un int que indica el numero de fechas que estan en
cualquiera de los meses en la lista de meses. (Nota: use la funcion del problema anterior).
Testing = val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]);
resp = 3
*)

fun number_in_months (date: (int*int*int) list, month: int list) =
    if null month
    then 0
    else number_in_month(date, hd(month)) + number_in_months(date, tl(month))



(*Funcion 4
toma una lista de fechas y una lista de
meses (una lista de enteros) y retorna un int que indica el número de fechas que están en
cualquiera de los meses en la lista de meses. (Nota: use la función del problema anterior).
 *)

fun dates_in_month([], _) = []
  | dates_in_month(dates : (int*int*int)list as head::tail , month) =  if (#2 head) = month
                                                                        then head::dates_in_month(tail, month)
                                                                        else dates_in_month(tail, month);



(*Funcion 5
toma una lista de fechas y una lista de meses
(una lista de enteros) y retorna una lista de fechas que están en cualquiera de los meses de
la lista de meses. (Nota: use la función del problema anterior. También investigue y use el
operador @)
*)

fun dates_in_months([], _) = []
  | dates_in_months(_, []) = []
  | dates_in_months(dates : (int*int*int)list as d_head::d_tail, months : int list as m_head::m_tail) =
    let val tmp_list = dates_in_month(dates, m_head);
    in
      if tmp_list = [] then []
      else tmp_list::dates_in_months(dates, m_tail)
    end;


(*The @ operator is an "alias" or a shortcut of :: it takes two lists such as [1,2] and [2,3] and "conses"
every element of the first list into the second lists:

  [1,2] @ [3,4]
~> 1 : : ([2] @ [3,4])
~> 1:: (2: : ([] @ [3,4]))
~> 1::(2::[3,4])
~> 1 : : [2, 3 , 4]
~> [1,2,3,4]

Hansen, M. & Rischel, H. (1999). Introduction to programming using SML. Harlow, Eng.
  Reading, Mass: Addison Wesley.
*)

(*Funcion 6
toma una lista de strings y un entero n y retorna el iésimo
elemento de la lista, donde la cabeza de la lista es el primer elementos (i = 1). No se
preocupe por el caso en el que la lista tiene pocos elementos: su función puede aplicar el
hd o tl a la lista vacía en ese caso
test = val test6 = get_nth (["hi", "there", "how", "are", "you"], 2);
resp = "there"
*)

fun get_nth(listString : string  list, n : int) =
    if n = 1
    then hd(listString)
else get_nth(tl(listString),n-1)


(*Funcion 7
toma una fecha y retorna un string de la forma
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


(*Funcion 8
toma un int llamado sum, el cual
es positivo, y un int list, el cual se asume son enteros positivos; y al final retorna un int.
Se debe retornar un int n, tal que los primeros n elementos de la lista suman menos que
sum, pero los primeros n+1 elementos de la lista suman sum o más*)

fun number_before_reaching_sum(sum: int, numbers: int list)=
  let fun number_before_reaching_sum_helper (sum: int, numbers:int list, sumNow : int, n : int)=
    if sumNow > sum orelse numbers = [] orelse (hd(numbers) + sumNow) >= sum then n
    else
      number_before_reaching_sum_helper(sum, tl(numbers), hd(numbers)+sumNow, n+1);
  in
    number_before_reaching_sum_helper(sum, numbers, 0, 0)
  end


(*Funcion 9
toma un dia del año (un entero entre 1 y 365) y
retorna a cuál mes ese día pertence (1 para Enero, 2 para Febrero, etc.). Use una lista
conteniendo 12 enteros y la función del problema anterior.*)

fun what_month(day : int)=
  number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])+1;

(*Funcion 10
toma dos días del año día1 y día2 y retorna una
lista [m1, m2, …, mn] donde m1 es el mes de día1, m2 es el mes de día1 + 1, …, mn es el
mes del día2. Note que los resultados van a tener una longitud de día2 – día1 + 1 o
longitud 0 si día1 > día2*)
fun month_range(day1, day2) =
  (* let val months = [59,90,120,151,181,212,243,273,304,334,365]; *)

  let fun month_range_helper (remaining: int, day) =
      if remaining = 0 then what_month(day)::[]
      else what_month(day)::month_range_helper(remaining-1, day+1);
  in
    month_range_helper((day2 - day1), day1)
  end

(*Funcion 11
toma una lista de fechas y evalúa a una option
(int*int*int). Evalúa a NONE si la lista no tiene fechas y a SOME d si la fecha d es la más
vieja en la lista
Test = val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]);
resp = SOME (2011,3,31)
No completa

fun oldest (date: (int*int*int) list) =
    if null date
    then NONE
    else let
    fun old_date(date: (int*int*int) list) =
        if null (tl date)
        then (hd date)
        else if #1 (hd date) < #1 (hd(tl date)) orelse  (#1 (hd date) = #1 (hd(t                l date)) andalso #2 (hd date)
                < #2(hd(tl date))) orelse (#1 (hd date) = #1 (hd(tl date)
                andalso #2 (hd date) = #2(hd(tl date)) andalso #3 (hd date) < #3                (hd(tl date)))
        then old_date((tl date))
        else old_date((hd date)::drop(date,2))

    in
        SOME (old_date date)
    end
 *)
