(*toma un dia del año (un entero entre 1 y 365) y
retorna a cuál mes ese día pertence (1 para Enero, 2 para Febrero, etc.). Use una lista
conteniendo 12 enteros y la función del problema anterior.*)


fun what_month(day : int)=
  number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])+1;
