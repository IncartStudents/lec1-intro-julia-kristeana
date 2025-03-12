# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции
#= my_name = "kris"
answ = my_name
my_name = "42"
answ = my_name
answ
typeof(answ)
#=ghbdn
del
=#
9+99
12^4
s = "gth. olo"
s2 = "gth."ror" olo"
=#
#name =  "renol"
#numb1 = 10
#numb2 = 10*2
#println("hello, i am $name")
#println("hello, i am $numb1 and $numb2, becouse $(numb1^numb2).")


#concatanate
#=
#string("how many cats", "are too many cats")
#string("how many cats - answ ", 10. , "are too many cats", " maybe")
s3 = "ow many cats "
s4 = "are too many cats"
#s3*s4
"$s3$s4"
=#



#dictionaries

my_notebook = Dict("best" => "890-323-323", "hell" => "890-111-999")


my_notebook["kraken"] = "553-am-560"

my_notebook
#извлечение значения из словаря
my_notebook["kraken"]

# удаление элемента pop
pop!(my_notebook, "kraken")
my_notebook
#переименовывать словари:
my_notebook["kraken"] = "89058905"
my_notebook


# словари не упорядочены итерация порядка элемента нет


#tuples, кортежи
my_favoritefood = ("bliny", "borsh", "piroshki")
#вывод элемента (по индексу) отсчет с 1, перезначать,переимеовывать кортежинельзя
my_favoritefood[1]
#my_favoritefood[1] ="keks"


# array, массивы
my_friends = ["cats", "diamond", "Stoks"]
fibonacci = [1,1, 2, 3, 5, 8,]
mixed = [1, 2, 3.14, "meow"]
my_friends[3]
my_friends[3] = "badaa boo"
my_friends[1]
push!(fibonacci, 13, 21)
pop!(fibonacci)
fibonacci
favorite = [["poins", "line", "plane"], ["letter", "word", "sentence"]]
numers = [[1, 2, 4, 5], [2, 6, 8, 1.2]]
mixmix = [[1,2], ["mimimi", "mrmr"]]
rand(1,5)
rand(5,1)
randn(2,3)
randn(2,3, 5)


#= loops, циклы, 
while *condition*
    *loop body*
end
=#
n = 0
while n < 10
    n += 1
    println(n)
end

=#
#=
my_friends = ["cats", "diamond", "Stoks"]
i = 1
while i <= length(my_friends)
    friend = my_friends[i]
    println("hi, my friend $friend")
    i += 1
end

=#
#=
for n in 1:10
    println(n)
end

my_friends = ["cats", "diamond", "Stoks"]
for friend in my_friends
    println("hi, my friend $friend")
end
=#

m = 5
n = 5
A = zeros(m,n)







