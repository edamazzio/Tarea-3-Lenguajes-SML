(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "homework.sml";


val test1 = if is_older ((1,2,3),(2,3,4)) = true then 1 else 0
val test2 = if is_older ((2018,6,15),(2018,5,31)) = false then 1 else 0
val test3 = if number_in_month ([(2012,2,28),(2013,12,1)],2) = 1 then 1 else 0
val test4 = if number_in_month ([(2012,2,28),(2013,12,1),(2018,5,2),(2158,2,2)],2) = 2 then 1 else 0
val test5 = if number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3 then 1 else 0
val test6 = if number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2 then 1 else 0
val test7 = if dates_in_month ([(2012,2,28),(2013,12,1),(2018,4,4),(2019,2,31)],2) = [(2012,2,28),(2019,2,31)] then 1 else 0
val test8 = if dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)] then 1 else 0
val test9 = if dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)] then 1 else 0
val test10 = if dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,4]) = [(2012,2,28),(2011,4,28)] then 1 else 0
val test11 = if get_nth (["hi", "there", "how", "are", "you"], 2) = "there" then 1 else 0
val test12 = if get_nth (["hi", "there", "how", "are", "you"], 5) = "you" then 1 else 0
val test13 = if date_to_string (2013, 6, 1) = "June 1, 2013" then 1 else 0
val test14 = if date_to_string (2019, 12, 31) = "December 31, 2019" then 1 else 0
val test15 = if number_before_reaching_sum (10, [1,2,3,4,5]) = 3 then 1 else 0
val test16 = if number_before_reaching_sum (12, [1,2,3,4,5]) = 4 then 1 else 0
val test17 = if number_before_reaching_sum (155, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]) = 17 then 1 else 0
val test18 = if what_month 70 = 3 then 1 else 0
val test19 = if what_month 155 = 6 then 1 else 0
val test20 = if what_month 289 = 10 then 1 else 0
val test21 = if what_month 365 = 12 then 1 else 0
val test22 = if month_range (31, 34) = [1,2,2,2] then 1 else 0
val test23 = if month_range (210, 220) = [7,7,7,8,8,8,8,8,8,8,8] then 1 else 0
val test24 = if oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31) then 1 else 0
val test25 = if oldest([(2018,2,28),(2018,11,31),(2011,4,28),(2000,4,28),(2015,4,28)]) = SOME(2000,4,28) then 1 else 0
val obtained = test1 + test2 + test3 + test4 + test5 + test6 + test7 + test8 + test9 + test10 + test11 + test12 + test13 + test14 + test15 + test16 + test17 + test18 + test19 + test20 + test21 + test22 + test23 + test24 + test25

val final_grade = (obtained * 100) div 25
