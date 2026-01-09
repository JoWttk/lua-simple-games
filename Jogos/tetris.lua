function Tetris()
    math.randomseed(os.time())

    local W, H = 10, 20

    local grid = {}
    for y = 1, H do
        grid[y] = {}
        for x = 1, W do
            grid[y][x] = 0
        end
    end

    local pieces = {
        {
            {1,1,1,1}
        },
        {
            {1,1},
            {1,1}
        },
        {
            {0,1,0},
            {1,1,1}
        },
        {
            {1,1,0},
            {0,1,1}
        },
        {
            {0,1,1},
            {1,1,0}
        }
    }

    local function clone(shape)
        local r = {}
        for y = 1, #shape do
            r[y] = {}
            for x = 1, #shape[y] do
                r[y][x] = shape[y][x]
            end
        end
        return r
    end

    local function rotate(shape)
        local r = {}
        for x = 1, #shape[1] do
            r[x] = {}
            for y = #shape, 1, -1 do
                table.insert(r[x], shape[y][x])
            end
        end
        return r
    end

    local function collision(px, py, shape)
        for y = 1, #shape do
            for x = 1, #shape[y] do
                if shape[y][x] == 1 then
                    local gx = px + x - 1
                    local gy = py + y - 1
                    if gx < 1 or gx > W or gy > H or (gy >= 1 and grid[gy][gx] == 1) then
                        return true
                    end
                end
            end
        end
        return false
    end

    local function fix(px, py, shape)
        for y = 1, #shape do
            for x = 1, #shape[y] do
                if shape[y][x] == 1 then
                    local gx = px + x - 1
                    local gy = py + y - 1
                    if gy >= 1 then
                        grid[gy][gx] = 1
                    end
                end
            end
        end
    end

    local function clearLines()
        for y = H, 1, -1 do
            local full = true
            for x = 1, W do
                if grid[y][x] == 0 then
                    full = false
                    break
                end
            end
            if full then
                table.remove(grid, y)
                local row = {}
                for x = 1, W do row[x] = 0 end
                table.insert(grid, 1, row)
                y = y + 1
            end
        end
    end

    local function draw(px, py, shape)
        os.execute("clear") -- esse comando limpa o terminal, no windows é cls
        for y = 1, H do
            io.write("|")
            for x = 1, W do
                local filled = grid[y][x] == 1
                for sy = 1, #shape do
                    for sx = 1, #shape[sy] do
                        if shape[sy][sx] == 1 then
                            if y == py + sy - 1 and x == px + sx - 1 then
                                filled = true
                            end
                        end
                    end
                end
                io.write(filled and "#" or ".")
            end
            print("|")
        end
        print(" a/d mover | w girar | s descer | q sair")
    end

    local shape = clone(pieces[math.random(#pieces)])
    local px = math.floor(W/2)
    local py = 0

    while true do
        draw(px, py, shape)

        local input = io.read()

        if input == "a" and not collision(px-1, py, shape) then px = px - 1 end
        if input == "d" and not collision(px+1, py, shape) then px = px + 1 end
        if input == "s" and not collision(px, py+1, shape) then py = py + 1 end
        if input == "w" then
            local r = rotate(shape)
            if not collision(px, py, r) then shape = r end
        end
        if input == "q" then break end

        if collision(px, py+1, shape) then
            fix(px, py, shape)
            clearLines()
            shape = clone(pieces[math.random(#pieces)])
            px = math.floor(W/2)
            py = 0
            if collision(px, py, shape) then
                print("GAME OVER")
                break
            end
        else
            py = py + 1
        end
    end
end

Tetris()