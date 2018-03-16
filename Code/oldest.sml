(*toma una lista de fechas y evalúa a una option
(int*int*int). Evalúa a NONE si la lista no tiene fechas y a SOME d si la fecha d es la más
vieja en la lista*)


fun is_older (date1 : int*int*int, date2 : int*int*int) =
  if #1 date1 < #1 date2
  then
    true
  else
    if #2 date1 < #2 date2
    then
      true
  else #3 date1 < #3 date2;

(* Pruebas
is_older ((2017,3,5),(2018,5,2));
is_older ((2018,3,5),(2018,5,2));
is_older ((2018,6,5),(2018,5,2));
is_older ((2018,5,5),(2018,5,2));
is_older ((2018,5,5),(2018,5,5));
is_older ((2018,5,4),(2018,5,5));
 *)
