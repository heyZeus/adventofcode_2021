local function new_board()
   return {
      winner = false,
      score = 0,
      last_number = 0,
      rows = {}
   }
end

local function cell_number(number)
   return tonumber(number)
end

local function board_cell(number, enabled)
   return {
      number = cell_number(number),
      enabled = enabled,
   }
end

local function render_board(board)
   for _, row in ipairs(board.rows) do
      local row_display = ""
      for _, cell in ipairs(row) do
         local enabled = cell.enabled and "* " or "  "
         row_display = row_display .. string.format("%2d%s ", cell.number, enabled)
      end
      print(row_display)
   end

   if board.winner then
      print("Last number: " .. board.last_number .. " Score: " .. board.score)
   end
end

local function is_bingo_winner(board)
   local column_cache = {}
   local row_size = #board.rows
   for _, row in ipairs(board.rows) do
      local row_enabled = 0
      for j, cell in ipairs(row) do
         if cell.enabled then
            row_enabled = row_enabled + 1
            column_cache[j] = (column_cache[j] or 0) + 1
            if column_cache[j] == row_size then
               return true
            end
         end
      end
      if row_enabled == row_size then
         return true
      end
   end
   return false
end

local function unmarked_score(board)
   local score = 0
   for _, row in ipairs(board.rows) do
      for _, cell in ipairs(row) do
         if not cell.enabled then
            score = score + cell.number
         end
      end
   end
   return score
end

local function draw_number(number, board)
   for _, row in ipairs(board.rows) do
      for _, cell in ipairs(row) do
         if cell.number == number then
            cell.enabled = true
         end
      end
   end

   if is_bingo_winner(board) then
      board.winner = true
      board.last_number = number
      board.score = unmarked_score(board) * number
   end
end

local function input_for(file)
   local random_numbers = {}
   local boards = {}
   local board = new_board()

   for line in io.lines(file) do
      if #random_numbers == 0 then
         for number in line:gmatch("(%d+)") do
            table.insert(random_numbers, cell_number(number))
         end
      else
         if line == "" and #board.rows > 0 then
            table.insert(boards, board)
            board = new_board()
         elseif line ~= "" then
            local row = {}
            for n in line:gmatch("(%d+)") do
              table.insert(row, board_cell(n, false))
            end
            table.insert(board.rows, row)
         end
      end
   end
   if #board.rows > 0 then
      table.insert(boards, board)
   end
   return {random_numbers = random_numbers, boards = boards}
end

local input = input_for("./input.txt")
local boards = input.boards
for _, number in ipairs(input.random_numbers) do
   for _, board in ipairs(boards) do
      if not board.winner then
         draw_number(number, board)
         if board.winner then
            render_board(board)
            print("")
         end
      end
   end
end
