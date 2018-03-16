(*toma una lista de strings y un entero n y retorna el iésimo
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
