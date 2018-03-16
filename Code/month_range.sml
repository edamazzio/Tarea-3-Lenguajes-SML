(*toma dos días del año día1 y día2 y retorna una
lista [m1, m2, …, mn] donde m1 es el mes de día1, m2 es el mes de día1 + 1, …, mn es el
mes del día2. Note que los resultados van a tener una longitud de día2 – día1 + 1 o
longitud 0 si día1 > día2*)
fun number_before_reaching_sum(sum: int, numbers: int list)=
  let fun number_before_reaching_sum_helper (sum: int, numbers:int list, sumNow : int, n : int)=
    if sumNow > sum orelse numbers = [] orelse (hd(numbers) + sumNow) >= sum then n
    else
      number_before_reaching_sum_helper(sum, tl(numbers), hd(numbers)+sumNow, n+1);
  in
    number_before_reaching_sum_helper(sum, numbers, 0, 0)
  end


fun what_month(day : int)=
  number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])+1;



fun month_range(day1, day2) =
  (* let val months = [59,90,120,151,181,212,243,273,304,334,365]; *)

  let fun month_range_helper (remaining: int, day) =
      if remaining = 0 then what_month(day)::[]
      else what_month(day)::month_range_helper(remaining-1, day+1);
  in
    month_range_helper((day2 - day1), day1)
  end
