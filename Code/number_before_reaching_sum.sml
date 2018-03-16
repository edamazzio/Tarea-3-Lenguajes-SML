(*toma un int llamado sum, el cual
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
