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



m, n = 5, 5
A = zeros(m, n)
for i in 1:m
    for j in 1:n
        A[i,j] = i + 2j
    end
end
A

B = zeros(m,n)
for i in 1:m, j in 1:n
         B[i,j] = i + j    
    end
end
B
# включение массива, массив изначально генерируется нулевой
C = [i + j for i in 1:m, j in 1:n]

for n in 1:10
    A = [i + j for i in 1:n, j in 1:n] 
    display(A)
end
#= условный оператор
if *Condition*
    *option1*
    elseif *Condition2*
        *option2*
    else
        *option3*
    end
=#
x = 99
y = 23
#= if x > y
    println("$x is large than $y")
    elseif y > x
        println("$x is less than $y")     
    else
        println("$x = $y")
    end
=#
if x > y
    x
else 
    y 
end 

#= тернарная операция, проверка условия с помощью символа ?

a ? b : C
if a
    b
else
    c
end
=#
(x < y) ? 5 : 4
# оценка с сокращенным вычилением short curkuit a && B возвращает истину, (выполняет только если истина), иначе лодь
(x > y) && println("okeey, $x < $y")
(x < y) && println("okeey, $x < $y")

# functions
function sanya(name)
        println("Hi, $name, abracadabra")
    end
sanya("piss")

function f(x)
    x^2
end

f(4)

sanya2(name) = println("hi, $name tell me")
f2(x) = x^3
sanya2("kelle")
sanya3 = name -> println("hi, $name nice to meet you")
f3 = x -> x^3
sanya3("priv")
f3(23)
sanya3(898909)
A = rand(5,5)
f3(A)
=#
#v = [3, 6, 2]
#sort!(v)
#v
function f(x)
    x^2
end
A = [i + 3*j for j in 0:2, i in 1:3]
f(A)
B = f.(A)
println("$B")
C = [2, 3]
C = [2,3].^2
#pakets
import Pkg
Pkg.add("Example")
using Example

hello("it's me")
Pkg.add("Colors")
using Colors
palette = distinguishable_colors(100)
rand(palette, 3, 3)
Pkg.add("Plots")
using Plots
# graphiks
x =-3:0.1:3
f(x) = x^2
y = f.(x)
gr()
plot(x,y, label="line")
scatter!(x, y, label="points")
#plotyjs()
plot(x, y, label="line")
scatter!(x, y, label="points")
globaltemperatures = [14.4, 14.6, 14.8, 15.0, 15.2, 15.5]
numirates = [45000, 50000, 15000,23000, 500]
plot(numirates, globaltemperatures, legend=false)
scatter!(numirates, globaltemperatures, legend=false)
xflip!()
xlabel!("number pirates[Approximate]")
xlabel!("temperature[C]")
title!("influence")
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
plot(p1, p2,p3, layout=(2,2), legend=false)
#множественная дискретизация multiple dispatch
methods(+)
@which 3 + 3
@which 3.0 + 3.2
@which 3.0 + 3
import Base: +
+(x::String, y::String) = string(x,y)
"hello" + "word"
@which "hello" + "word"
x = "Ira" + "zolotse"
println("$x")
foo(x, y) = println("duck-toop")
foo(x::Int, y::Float64) = println("x, y - integ. and float")
foo(x::Float64, y::Float64) = println("x, y - floats")
foo(x::Int, y::Int) = println("x, y - integs")
foo(x::String, y::String) = println("$x, $y it is string")
foo(1,1)
foo(1, 2.2)
foo(x, y)
foo(1.9, 7.8)
foo(true, false)
foo("take", "flip")

#linalg
A = rand(1:4, 3, 3)
B = A
C = copy(A)
[A B C]
A[2, 3] = 17
[B C]
A[3,4] = 15
[B C]
x = ones(3)
b = A*x
Asym = A + A'
Asym
A'
Apd = A'A
A\b
Atall = A[:, 1:2]
display(Atall)
Atall\b
A = randn(3, 3)






