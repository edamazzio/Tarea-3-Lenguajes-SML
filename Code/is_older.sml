(*toma dos fechas y retorna un booleano. El retorno es
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


(* Pruebas
is_older ((2017,3,5),(2018,5,2));
is_older ((2018,3,5),(2018,5,2));
is_older ((2018,6,5),(2018,5,2));
is_older ((2018,5,5),(2018,5,2));
is_older ((2018,5,5),(2018,5,5));
is_older ((2018,5,4),(2018,5,5));
 *)
