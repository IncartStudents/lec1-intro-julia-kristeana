module GameOfLife
using Plots

mutable struct Life
    current_frame::Matrix{Int}
    next_frame::Matrix{Int}
end

function step!(state::Life)
    curr = state.current_frame
    next = state.next_frame
    rows, cols = size(curr)
    summa = 0
    for i in 1:rows
    for j in 1:cols
    for x in -1:1
    for y in -1:1
        if x == 0 && y == 0
         continue
        end
        neight_row = mod1(i + x, rows)
        neight_col = mod1(j + y, cols)
        summa += curr[neight_row, neight_col]
    end
end

if curr[i, j] == 1 
    if summa < 2
        next[i, j] == 0
    elseif summa > 3
        next[i, j] == 0
    else
        next[i, j] = 1
        continue
    else
        if summa = 3
    next[i, j] == 1
    else next[i, j] = 0
    end
end
end
end
        #=
    TODO: вместо случайного шума
    реализовать один шаг алгоритма "Игра жизнь"
    =#
    for i in 1:length(curr)
        curr[i] = rand(0:1)
    end

    # Подсказка для граничных условий - тор:
    # julia> mod1(10, 30)
    # 10
    # julia> mod1(31, 30)
    # 1

    return nothing
end

function (@main)(ARGS)
    n = 30
    m = 30
    init = rand(0:1, n, m)

    game = Life(init, zeros(n, m))

    anim = @animate for time = 1:100
        step!(game)
        cr = game.current_frame
        heatmap(cr)
    end
    gif(anim, "life.gif", fps = 10)
end

export main

end

using .GameOfLife
GameOfLife.main("")
