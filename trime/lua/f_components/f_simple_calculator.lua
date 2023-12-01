--[[
簡易計算機
--]]

local function str_to_cal(str)
  return load("return "..str)()
end


local function simple_calculator(input)
  -- print('原始輸入：'..input)
  local error_check = string.match(input, "^[-.(%d][-+*/^().%d]*$")
  local error_2oper = string.match(input, "[-+*/^][-+*/^]")
  local error_dot = string.match(input, "[.]%d+[.]%d") or
                    string.match(input, "[.][.]")
  local error_paren = string.match(input, "^[^(]+[)]") or
                      string.match(input, "[-+*/^(][)]") or
                      string.match(input, "[(][+*/^]")
                      -- string.match(input, "[)]%d")

  -- if not ok_1 then return print("輸入錯誤1") end
  -- if error_1 or error_2 then return print("輸入錯誤2") end
  if not error_check then return "Error (check)" end
  if error_2oper then return "Error (2oper)" end
  if error_dot then return "Error (dot)" end
  if error_paren then return "Error (paren)" end

  local input = string.gsub(input, "%.([-+*/^()])", "%1")  -- 允許小數點末尾多加，如：237.+271
  local input = string.gsub(input, "([)%d])[(]", "%1*(")  -- 2(9) 或 (2)(9) 中間轉為乘法
  local input = string.gsub(input, "[)]([)%d])", ")*%1")  -- (2)9 或 (2)9 中間轉為乘法
  local input = string.gsub(input, "[(]+([-]?[.%d]+)$", "%1")  -- 未完成前，括號後，末尾為數字
  local input = string.gsub(input, "[(]+([^()]*)$", "%1")  -- 未完成前，括號後，末尾為計算符號
  local input = string.gsub(input, "[-+*/^(.]+$", "")  -- 未完成前，末尾為計算符號
  -- print('轉換後：'..input)

  local ok, res = pcall(str_to_cal, input)
  if ok then
    -- print('最終結果：'..str_to_cal(input))
    -- print(ok)
    -- print(res)
    result = string.gsub(str_to_cal(input), "%.0$","")
    -- result = string.format("%f",str_to_cal(input))
    return result
  else
    -- print('輸入錯誤！')
    -- print(ok)
    -- print(res)
    return "Error！ (by_pcall)"
  end
end

--- 測試
-- print(simple_calculator('5^(1+1+1)+(9+9)'))
-- print(simple_calculator('27^(1/3)'))
-- print(simple_calculator('9/(3.3.'))
-- print(simple_calculator('(-1/3)'))
-- print(simple_calculator('3+(.3'))

return simple_calculator