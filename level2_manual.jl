# Выболнить большую часть заданий ниже - привести примеры кода под каждым комментарием


#===========================================================================================
1. Переменные и константы, области видимости, cистема типов:
приведение к типам,
конкретные и абстрактные типы,
множественная диспетчеризация,
=#
x = 5
typeof(x)
# множественная диспетчерезация
fn(x::Int, y::Int) = println("$x, $y - are integers")
fn(x::Float64, y::Float64) = println("$x, $y - are Floats")
fn(x::Float64, y::Int) = println("$x, - int $y - is Float")
fn(x::String, y::String) = println("$x $y wow, you are amazing")
fn(2, 4)
fn("The best", "day")

# Что происходит с глобальной константой PI, о чем предупреждает интерпретатор?
const PI = 3.14159
PI = 3.14
Pi переопределили значение
# Что происходит с типами глобальных переменных ниже, какого типа `c` и почему?
a = 1
b = 2.0
c = a + b
a = 1
b = 2.0
c = a + b
typeof(a)
typeof(b)
typeof(c)
# Переменная с стала float, потому что результат вычисление
# int + float = float ( то есть float шире)
# Что теперь произошло с переменной а? Как происходит биндинг имен в Julia?
a = "foo"
#теперь переменная a - string, то есть при вызове a будет возвращаться "foo",
#пока переменную не переинициализируют снова
# Что происходит с глобальной переменной g и почему? Чем ограничен биндинг имен в Julia?
g::Int = 1
g = "hi"
# глобальная переменная объявлена как integer, теперь в g можно записать только int
function greet()
    g = "hello"
    println(g)
end
greet()
# в функции можно перобъявлять тип переменных, но при выходе из функции тип
# переменной будет таким, каким его объявляли глобально

# Чем отличаются присвоение значений новому имени - и мутация значений?
v = [1,2,3]
z = v
v[1] = 3
v = "hello"
z
# z - присваивает знаяения вектора v, v[1] - мутированный вектор, z - ссылается на немутированный вектор
# присвоение - присвоение значения новой переменной, мутация - изменение значения
# Написать тип, параметризованный другим типом
xp(x,y) = x.^2 + y
xp(2, 3)
xp(2.2, 3)
#=
Написать функцию для двух аругментов, не указывая их тип,
и вторую функцию от двух аргментов с конкретными типами,
дать пример запуска
=#
function fun(x, y)
    x + y
end
fun(3.5, 7.0) # 10.5

function fun1(x::Int, y::INT)
    x + y
end
fun1(5, 9) # 14
#=
Абстрактный тип - ключевое слово? abstract type 
Примитивный тип - ключевое слово? primitive type
Композитный тип - ключевое слово? struct
=#

#=
Написать один абстрактный тип и два его подтипа (1 и 2)
Написать функцию над абстрактным типом, и функцию над её подтипом-1
Выполнить функции над объектами подтипов 1 и 2 и объяснить результат
(функция выводит произвольный текст в консоль)
=#
abstract type Car end
#color::Car = a.color
struct Hona <: Car 
model::String
color::String

car_mileage::Int
end
struct Opel <: Car end
model::String
color::String
car_mileage::Int
do_I_like_it::Bool
end
a = Hona("XP12", "black", 1100)
b = Opel("vectra", "grey", 1500, true)
function x1(a)
    println("$a")    
end
x1(a)

#===========================================================================================
2. Функции:
лямбды и обычные функции,
переменное количество аргументов,
именованные аргументы со значениями по умолчанию,
кортежи
=#

# Пример обычной функции
f(x, y) = x + 5*y 
f(4, 3)
end
# Пример лямбда-функции (аннонимной функции)
function (x)
    x^2 + 2*x
end
f(22)
x ->  x^2 + 2*x
# Пример функции с переменным количеством аргументов
rargs(x, y, sum...) = (x, y, sum)
rargs(5, 4, 2, 2)
if x < y
    z = x + y
else 
    y
end
# Пример функции с именованными аргументами
 function plot(x, y; width=1, color="pink")
    end
# Функции с переменным кол-вом именованных аргументов

    function plot(x...; width=1, color="pink")
    end
#=
Передать кортеж в функцию, которая принимает на вход несколько аргументов.
Присвоить кортеж результату функции, которая возвращает несколько аргументов.
Использовать splatting - деструктуризацию кортежа в набор аргументов.
=#
foo(a, b...) = (a, b)
c = (1, 5, 8, 9)
fox = (foo(2, c), 9)
fox[1]
# (2, ((1, 5, 8, 9),))
#===========================================================================================
3. loop fusion, broadcast, filter, map, reduce, list comprehension
=#

#=
Перемножить все элементы массива
- через loop fusion и
- с помощью reduce
=#
function pro()
    A = [1, 5, 10, 12]
    res = 1
    for i in 1:length(A)
        res = res * A[i]    
        println("%res")
    end
    return res
end
println( pro())

 reduce(*, [2; 8; 4])
#=
Написать функцию от одного аргумента и запустить ее по всем элементам массива
с помощью точки (broadcast)
c помощью map
c помощью list comprehension
указать, чем это лучше явного цикла?
=#
function foo(x...)
x = (1, 2, 5, 7)
i = 1
for i ∈ length(x)
    y = 4 + (broadcast)sin(x)
end
end

function foo(x...)
x = (1, 2, 5, 7)
i = 1
for i ∈ length(x)
    y = 4 + (map)sin(x)
end
end
list comprehennsion занимает меньше места

# Перемножить вектор-строку [1 2 3] на вектор-столбец [10,20,30] и объяснить результат

    S = [1, 2, 3]
    S'
    A = [10, 20, 30]
    S'.*A
S' транспонирование матрицы, Точка нужна, чтоб перемножать вектора поэлементно.
# В одну строку выбрать из массива [1, -2, 2, 3, 4, -5, 0] только четные и положительные числа
A = [1,-2, 2, 3, 4, -5, 0]
B = [A[i] for i in 1:length(A) if A[i] > 0 && A[i] % 2 == 0]
B
# Объяснить следующий код обработки массива names - что за number мы в итоге определили?
using Random
Random.seed!(123)
names = [rand('A':'Z') * '_' * rand('0':'9') * rand([".csv", ".bin"]) for _ in 1:100]
# ---
same_names = unique(map(y -> split(y, ".")[1], filter(x -> startswith(x, "A"), names)))
numbers = parse.(Int, map(x -> split(x, "_")[end], same_names))
numbers_sorted = sort(numbers)
number = findfirst(n -> !(n in numbers_sorted), 0:9)
#Random.seed! - Функция, unique Возвращает массив, содержащий только уникальные элементы , map преобразовывает //будет  Преобразовать коллекцию c, применяя fк каждому элементу, берет только 1 часть значения (до точки). Фильтр определяет строк, где первый элемент А затем работает с ним 
# numbers: parse преобразует строку в тип int для каждого элемента, где элемент - это последняя часть (после _ - то есть число) каждого компонента от ветктора same_names)
# sort(numbers) сортирует и записывает в numbers_sorted
# создается массив элементов от нуля до 9, findfirst ищет первый элемент, который не встречается в векторе numbers_sorted и выводит его порядковый номер.
# Упростить этот код обработки
 using Random
Random.seed!(123)
names = [string(rand('A':'Z'), '_', rand('0':'9'),
 rand([".csv", ".bin"])) for _ in 1:100]
same_names = unique([split(y, ".")[1] for y in names if startswith(y, "A")])
numbers = sort(parse.(Int, map(x -> split(x, "_")[end], same_names)))
number = findfirst(n -> !(n in numbers), 0:9)

#===========================================================================================
4. Свой тип данных на общих интерфейсах
=#

mutable struct Animal
    cat::String
    dog::String
    fish::String
end
# интерфейс вывода Animalal
Base.show(i0::IO, animal::Animal) = print(i0, "Animal(cat=\"", animal.cat, "\", dog=\"", animal.dog, "\", fish=\"", animal.fish, "\")")
my_animal = Animal("Мия", "Бос","Немо")
println(my_animal)
# copy
Base.copy(animal::Animal) = Animal(animal.cat, animal.dog, animal.fish) 
Base.show(i0::IO, animal::Animal) = print(i0, "Animal(cat=\"", animal.cat, "\", dog=\"", animal.dog, "\", fish=\"", animal.fish, "\")")
my_animal_2 = copy(my_animal)
println("копия ", my_animal_2)
my_animal_2.cat = "Милли"
println("копия ", my_animal_2)

#=
написать свой тип ленивого массива, каждый элемент которого
вычисляется при взятии индекса (getindex) по формуле (index - 1)^2
=#

#=import Pkg; Pkg.add("LazyArrays") # загрузка пакета
using LazyArrays, LinearAlgebra
A = LazyArray{6, 5}
B = [((i- 1)^2) for i in 1:6, j in 1:5]
=#

struct LazyArray
    length::Int
end

Base.getindex(arr::LazyArray, i::Int) = (i - 1)^2  # Вычисление элемента по индексу

# Пример 
lazy_array = LazyArray(15) # ленивый массив длиной 15

println(lazy_array[5]) # вывод 5 элемента массива
#=
Написать два типа объектов команд, унаследованных от AbstractCommand,
которые применяются к массиву:
`SortCmd()` - сортирует исходный массив
`ChangeAtCmd(i, val)` - меняет элемент на позиции i на значение val
Каждая команда имеет конструктор и реализацию метода apply!
=#
abstract type AbstractCommand end
apply!(cmd::AbstractCommand, target::Vector) = error("Not implemented for type $(typeof(cmd))")
struct Sort <: AbstractCommand
end

struct ChangeAt <: AbstractCommand
    index::Int
    val::Any
end

function apply!(cmd::Sort, target::Vector)
    sort!(target)
end

function apply!(cmd::ChangeAt, target::Vector)
    target[cmd.index] = cmd.val
end

A = [0, 5, 2, 4,]
B = Sort() 
apply!(B, A)
println(A)

C = ChangeAt(2, 38)
apply!(C, A)
println(A) # [0, 38 4, 5]
# Аналогичные команды, но без наследования и в виде замыканий (лямбда-функций)
function Sort_2()
    return (target::Vector) -> sort!(target)
end

function ChangeAt_2(index::Int, val::Any)
    return (target::Vector) -> target[index] = val
end

AppSort_2 = Sort_2()
AppChangeAt_2 = ChangeAt_2(2, 38)

A = [4, 5, 6, 1, 0]
AppSort_2(A)
println(A)
AppChangeAt_2(A)
println(A) # [0, 38, 4, 5, 6]

#===========================================================================================
5. Тесты: как проверять функции?
=#

# Написать тест для функции
function foo(x)
    x = (1, 2, 5, 7)  # Заменяем входной x на кортеж (1, 2, 5, 7)
    i = 1  # i не используется внутри цикла
    y = () #Инициализируем, для доступа после цикла
    for i in 1:length(x)
        y = map(x -> x + 4, x)  # map применяет функцию к каждому элементу кортежа
    end
    return Tuple(y) #возвращаем кортеж
end
using Test
@test foo((1, 2, 5, 7)) == (5, 6, 9, 11)

#===========================================================================================
6. Дебаг: как отладить функцию по шагам?
=#

#=
Отладить функцию по шагам с помощью макроса @enter и точек останова
=#

function foo(x, y)
    a = x * y
    b = a^2 
    return b
end

@enter foo(5, 3)

#===========================================================================================
7. Профилировщик: как оценить производительность функции?
=#
using Profile
функция для профилировки
#профилирование включается для данного вызова с помощью @profil eмакроса.
@profile 'имя функции'
#Получить результаты профилирования
Profile.print()
#=
Оценить производительность функции с помощью макроса @profview,
и добавить в этот репозиторий файл со скриншотом flamechart'а
=#

import Pkg
Pkg.add("ProfileView")
using Profile
function generate_data(len)
    vec1 = Any[]
    for k = 1:len
        r = randn(1,1)
        append!(vec1, r)
    end
    vec2 = sort(vec1)
    vec3 = vec2 .^ 3 .- (sum(vec2) / len)
    return vec3
end
generate_data(4)
@profview generate_data(1000000)


# Переписать функцию выше так, чтобы она выполнялась быстрее:
using ProfileView

function generate_data(len::Int) # Добавляем указание типа для len
    vec1 = Vector{Float64}(undef, len)
    for i = 1:len
        vec1[i] = randn()
    end
    vec2 = sort(vec1)
    vec3 = vec2 .^ 3 .- (sum(vec2) / len)
    return vec3
end

@profview generate_data(1_000_000);

#===========================================================================================
8. Отличия от матлаба: приращение массива и предварительная аллокация?
=#

#=
Написать функцию определения первой разности, которая принимает и возвращает массив
и для каждой точки входного (x) и выходного (y) выходного массива вычисляет:
y[i] = x[i] - x[i-1]
=#
function fun(x)
    n = length(x)
    y = Vector(undef, n-1)

    for i in 1:(n-1)
    y[i] = x[i+1] - x[i]
    end
    return y
end
x = [11, 3, 4, 6, 6]
d = fun(x)
#=
Аналогичная функция, которая отличается тем, что внутри себя не аллоцирует новый массив y,
а принимает его первым аргументом, сам массив аллоцируется до вызова функции
=#
x = [11, 3, 4, 6, 6]
y = Vector(undef, length(x)-1)

function fun(y, x)
    n = length(x)
    for i in 1:(n-1)
    y[i] = x[i+1] - x[i]
    end
    return y
end

d = fun(x)
#=
Написать код, который добавляет элементы в конец массива, в начало массива,
в середину массива
=#
x = [10, 2, 4, 4, 9]
y = [0, 1]
z = Vector{Int}(undef, length(x)+length(y))

function beginning(z, x, y)
    for i in 1:(length(y))
    z[i] = y[i]
    end
    for i in 1:(length(x))
    z[length(y)+i] = x[i]
    end
    return z
end
d = beginning(z, x, y)

function middle(z, x, y)
    n = div(length(x), 2)

    for i in 1:n
        z[i] = x[i]
    end
    for i in 1:(length(y))
        z[n+i] = y[i]
    end
    for i in (n+1):length(x)
        z[length(y)+i] = x[i]
    end
    return z
end
d = middle(z, x, y)


function ending(z, x, y)
    for i in 1:(length(x))
        z[i] = x[i]
        end
        for i in 1:(length(y))
        z[length(x)+i] = y[i]
        end
        return z
end
d = ending(z, x, y)

#===========================================================================================
9. Модули и функции: как оборачивать функции внутрь модуля, как их экспортировать
и пользоваться вне модуля?
=#

module 'name' #создать модуль, 
import 'libraries' # подключение библиотек
export 'name_function', 'name_struct' # функции, которые будут использованы за  пределами модуля
# тело модуля, здесь можно прописать функции,структуры
using .'name_function', 'name_struct' # для использования функций, модулей за пределами структуры необходимо прописать ключевое слово using и имя необходимых методов через точку

#=
Написать модуль с двумя функциями,
экспортировать одну из них,
воспользоваться обеими функциями вне модуля
=#
module Foo
    export foo
end
function foo(x, y) 3*x + 5*y
end
foo2(a, b) = a + b
 using .Foo
foo(2, 3)
foo2(1, 4)

#===========================================================================================
10. Зависимости, окружение и пакеты
=#

# Что такое environment, как задать его, как его поменять во время работы?
Переменная окружения - глобальная переменная, которая содержит некторую информацию, которая используется при запуске программы. Например, значением этой переменной моут быть:
место размещения файлов в системе, рабочие директории, модули, пакеты
задание переменного окружения через ENV
ENV["переменная"] = "значение"  # ENV["JULIA_EDITOR"] = "vimp"
 можено добавлять пакеты в окружение с помощью команды add
 можете сменить окружение, выполнив команду activate в режиме Pkg:


# Что такое пакет (package), как добавить новый пакет?
Пакет - встроенный дополнительный функционал,
import Pkg
Pkg.add("Example") # где в "" - указан нужный пакет
using Example # для запуска/использования пакета

# Как начать разрабатывать чужой пакет?
1. добавить пакет (Pkg.add("MyPackage"))
2. клонировать репозиторий к себе (git clone https://.../MyPackage.jl)
3. Перейти в каталог пакета (cd MyPackage.jl)
4. Активировать пакет 
using Pkg
Pkg.activate(".") 


Как создать свой пакет?
(необязательно, эксперименты с PkgTemplates проводим вне этого репозитория)
=#


#===========================================================================================
11. Сохранение переменных в файл и чтение из файла.
Подключить пакеты JLD2, CSV.
=#
import Pkg
Pkg.add("JLD2") 
Pkg.add("CSV") 
Pkg.add("DataFrames") 
using CSV, JLD2, DataFrames

# Сохранить и загрузить произвольные обхекты в JLD2, сравнить их
data1 = 1
data2 = 2
jldsave("my_data.jld2"; data1=data1, data2=data2)
loaded_data = load("my_data.jld2")
println(data1 > data2)
# Сохранить и загрузить табличные объекты (массивы) в CSV, сравнить их

data3 = (Name = ["Borya", "Lev"], Age = ["22", "18"])
data4 = (Name = ["Ilya", "Sanya"], Age = ["20", "26"])

CSV.write("my_date_one.csv", data3)
CSV.write("my_date_two.csv", data4)

loaded_data3 = CSV.read("my_date_one.csv", DataFrame)
loaded_data4 = CSV.read("my_date_two.csv", DataFrame)
#age_x = (Int64, x[2, 2])  
#age_y = (Int64, y[2, 2])
# println(age_x > age_y)
println(x[2, 2] > y[2,2])

#===========================================================================================
12. Аргументы запуска Julia
=#

#=
Как задать окружение при запуске?
=#
import Pkg
Pkg.add("NAME") 
using NAME
#=
Как задать скрипт, который будет выполняться при запуске:
а) из файла .jl
б) из текста команды? (см. флаг -e)
=#
а) создать файл C:\Users\...\proverka.jl . После в файле где работаем написать:
include("proverka.jl")
б) Нажать клавишу Windows и R.
Ввести cmd в поле поиска.
Нажать правой кнопкой мыши на командную строку и выбрать «Запуск от имени администратора».


C:\Users\M\AppData\Local\Programs\Julia-1.11.3\bin\julia -e "println(\"Hi Julia!\")"
#=
После выполнения задания Boids запустить julia из командной строки,
передав в виде аргумента имя gif-файла для сохранения анимации
=#
