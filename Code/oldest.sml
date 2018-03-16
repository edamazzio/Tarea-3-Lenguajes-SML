(*toma una lista de fechas y evalúa a una option
(int*int*int). Evalúa a NONE si la lista no tiene fechas y a SOME d si la fecha d es la más
vieja en la lista*)


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
