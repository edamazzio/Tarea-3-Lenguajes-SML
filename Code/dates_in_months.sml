



fun dates_in_month([], _) = []
  | dates_in_month(dates : (int*int*int)list as head::tail , month) =  if (#2 head) = month
                                                                        then head::dates_in_month(tail, month)
                                                                        else dates_in_month(tail, month);

(*Tests

dates_in_months([(2017,5,3),(2015,3,1)], 5 );
dates_in_months([(2017,5,3),(2015,5,1)], 5 );
dates_in_months([(2017,5,3),(2015,5,1)], 3 );

*)



(*toma una lista de fechas y una lista de meses
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


(*
Tests
dates_in_months([(2017,5,3),(2015,3,1),(2010,3,28), (2015,8,1), (2015,9,1), (2015,5,1)], [5,3] );
*)

(*
The @ operator is an "alias" or a shortcut of :: it takes two lists such as [1,2] and [2,3] and "conses"
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
