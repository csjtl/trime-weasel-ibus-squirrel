--[[
從 lunar_calendar 資料夾匯入兩個農曆相關函數集合
--]]

----------------------------------------------------------------------------------------
--- 版本訊息

local Ver_info = require("f_components/f_ver_info")

----------------------------------------------------------------------------------------
--- 日期時間各種格式轉寫

local timezone_out = require("f_components/f_timezone_out")

local f_y_s = require("f_components/f_year_style")
local min_guo = f_y_s.min_guo
local jp_ymd = f_y_s.jp_ymd

local f_d_s = require("f_components/f_date_style")
local ch_y_date = f_d_s.ch_y_date
local ch_m_date = f_d_s.ch_m_date
local ch_d_date = f_d_s.ch_d_date
local ch_h_date = f_d_s.ch_h_date
local ch_minsec_date = f_d_s.ch_minsec_date
local chb_y_date = f_d_s.chb_y_date
local chb_m_date = f_d_s.chb_m_date
local chb_d_date = f_d_s.chb_d_date
local chb_h_date = f_d_s.chb_h_date
local chb_minsec_date = f_d_s.chb_minsec_date
local jp_m_date = f_d_s.jp_m_date
local jp_d_date = f_d_s.jp_d_date
local eng1_m_date = f_d_s.eng1_m_date
local eng2_m_date = f_d_s.eng2_m_date
local eng3_m_date = f_d_s.eng3_m_date
local eng1_d_date = f_d_s.eng1_d_date
local eng2_d_date = f_d_s.eng2_d_date
local eng3_d_date = f_d_s.eng3_d_date
local eng4_d_date = f_d_s.eng4_d_date

local f_c_d_s = require("f_components/f_chinese_date_style")
local rqzdx1 = f_c_d_s.rqzdx1
local rqzdx2 = f_c_d_s.rqzdx2

local weekstyle = require("f_components/f_week_style")

local f_t_s = require("f_components/f_time_style")
local time_out1 = f_t_s.time_out1
local time_out2 = f_t_s.time_out2

----------------------------------------------------------------------------------------
--- 農曆相關轉換
local lc_1 = require("lunar_calendar/lunar_calendar_1")
local Dec2bin = lc_1.Dec2bin
local Date2LunarDate = lc_1.Date2LunarDate
local LunarDate2Date = lc_1.LunarDate2Date
-- local GetNextJQ = lc_1.GetNextJQ
local GetNowTimeJq = lc_1.GetNowTimeJq
local lunarJzl = lc_1.lunarJzl

local lc_2 = require("lunar_calendar/lunar_calendar_2")
local time_description_chinese = lc_2.time_description_chinese
local Moonphase_out1 = lc_2.Moonphase_out1
local Moonphase_out2 = lc_2.Moonphase_out2
local jieqi_out1 = lc_2.jieqi_out1

local GetLunarSichen = require("lunar_calendar/lunar_time")

----------------------------------------------------------------------------------------
--- 數字字母各種格式轉寫

local f_n_s = require("f_components/f_number_style")
local formatnumberthousands = f_n_s.formatnumberthousands
local fullshape_number = f_n_s.fullshape_number
local math1_number = f_n_s.math1_number
local math2_number = f_n_s.math2_number
local circled1_number = f_n_s.circled1_number
local circled2_number = f_n_s.circled2_number
local circled3_number = f_n_s.circled3_number
local circled4_number = f_n_s.circled4_number
local circled5_number = f_n_s.circled5_number
local purech_number = f_n_s.purech_number
local military_number = f_n_s.military_number
local little1_number = f_n_s.little1_number
local little2_number = f_n_s.little2_number
local braille_c_number = f_n_s.braille_c_number
local braille_u_number = f_n_s.braille_u_number
local keycap_number = f_n_s.keycap_number

local f_c_n = require("f_components/f_chinese_number")
local read_number = f_c_n.read_number
local read_number_bank = f_c_n.read_number_bank
local confs = f_c_n.confs

local f_e_s = require("f_components/f_english_style")
local english_1 = f_e_s.english_1
local english_2 = f_e_s.english_2
local english_3 = f_e_s.english_3
local english_4 = f_e_s.english_4
local english_5 = f_e_s.english_5
local english_6 = f_e_s.english_6
local english_7 = f_e_s.english_7
local english_8 = f_e_s.english_8
local english_9 = f_e_s.english_9
local english_f_u = f_e_s.english_f_u
local english_f_l = f_e_s.english_f_l
local english_s_u = f_e_s.english_s_u
local english_1_2 = f_e_s.english_1_2
local english_3_4 = f_e_s.english_3_4
local english_5_6 = f_e_s.english_5_6
local english_f_ul = f_e_s.english_f_ul
local english_s = f_e_s.english_s
local english_s2u = f_e_s.english_s2u
local english_braille_c_u = f_e_s.english_braille_c_u
local english_braille_c_l = f_e_s.english_braille_c_l
local english_braille_c_ul = f_e_s.english_braille_c_ul
local english_braille_u_u = f_e_s.english_braille_u_u
local english_braille_u_l = f_e_s.english_braille_u_l
local english_braille_u_ul = f_e_s.english_braille_u_ul

----------------------------------------------------------------------------------------
--- Unicode 等各種字符編碼轉換

local utf8_sub = require("f_components/f_utf8_sub")

local utf8_out = require("f_components/f_utf8_out")

local url_encode = require("f_components/f_url_encode")

local url_decode = require("f_components/f_url_decode")

----------------------------------------------------------------------------------------
--- 計算機

local simple_calculator = require("f_components/f_simple_calculator")

----------------------------------------------------------------------------------------
--- 按鍵說明

local hotkeys = require("f_components/f_hot_keys")

----------------------------------------------------------------------------------------
--- 快捷開啟

local run_pattern = require("p_components/p_run_pattern")
local run_menu = require("p_components/p_run_menu")

----------------------------------------------------------------------------------------
--- 置入方案範例
--[[
engine:
  translators:
    - lua_translator@mf_translator

mf_translator:
  prefix: "'/"  # "`" 或其他
--]]
----------------------------------------------------------------------------------------
local function init(env)
  local engine = env.engine
  local schema = engine.schema
  local config = schema.config
  -- local namespace = "mf_translator"
  env.prefix = config:get_string(env.name_space .. "/prefix")
  env.schema_id = config:get_string("schema/schema_id")
  env.menu_table = {
        -- { "〔半角〕", "`" }
        { "  f〔年月日〕  ym〔年月〕  md〔月日〕", "⓪" }
      , { "  y〔年〕  m〔月〕  d〔日〕  w〔週〕", "①" }
      , { "  n〔時:分〕  t〔時:分:秒〕", "②" }
      , { "  fw〔年月日週〕  mdw〔月日週〕", "③" }
      , { "  fn〔年月日 時:分〕  ft〔年月日 時:分:秒〕", "④" }
      , { "  p〔程式格式〕  z〔時區〕  s〔節氣〕  l〔月相〕", "⑤" }
      -- , { "  ○/○/○〔 ○ 年 ○ 月 ○ 日〕  ○/○〔 ○ 月 ○ 日〕", "⑥" }
      -- , { "  ○-○-○〔○年○月○日〕  ○-○〔○月○日〕", "⑦" }
      , { "  ○ y ○ m ○ d〔○年○月○日〕", "⑥" }
      , { "  ○ y ○ m〔○年○月〕    ○ m ○ d〔○月○日〕", "⑦" }
      , { "  ○ y〔○年〕    ○ m〔○月〕    ○ d〔○日〕", "⑧" }
      -- , { "  ○○○〔數字〕", "⑨" }
      , { "  [-.0-9]+〔數字〕", "⑨" }
      , { "  [-.0-9]+[ + - * / ^ ( ) ]...〔簡易計算機〕", "⑩" }
      , { "※ 算符： ‹+ a›   ‹- r›   ‹* x›   ‹/ v›   ‹^ s›   ‹ ( q›   ‹ ) w› ", "⑪" }
      , { "  / [a-z , . - \' / ]+〔小寫字母〕", "⑫" }
      , { "  ; [a-z , . - \' / ]+〔大寫字母〕", "⑬" }
      , { "  \' [a-z , . - \' / ]+〔開頭大寫字母〕", "⑭" }
      , { "  e [0-9a-f]+〔Percent/URL encoding〕", "⑮" }
      , { "  u [0-9a-f]+〔內碼十六進制 Hex〕(Unicode)", "⑯" }
      , { "  x [0-9a-f]+〔內碼十六進制 Hex〕(Unicode)", "⑰" }
      , { "  c [0-9]+〔內碼十進制 Dec〕", "⑱" }
      , { "  o [0-7]+〔內碼八進制 Oct〕", "⑲" }
      , { "  j [a-z]+〔快捷開啟〕", "⑳" }
      , { "  kk〔快捷鍵 說明〕", "㉑" }
      , { "  ko〔操作鍵 說明〕", "㉒" }
      , { "  kh〔韓文 HNC 說明〕(注音系列)", "㉓" }
      , { "  ks〔韓文 洋蔥形碼 說明〕(形碼系列)", "㉔" }
      , { "  kj〔日文 羅馬字 說明〕", "㉕" }
      , { "  ki〔拉丁 IPA國際音標 說明〕", "㉖" }
      , { "  kp〔拉丁 KK/DJ/IPA音標 說明〕", "㉗" }
      , { "  v〔版本資訊〕", "㉘" }
      , { "  g〔Lua 所佔記憶體〕(Garbage)", "㉙" }
      , { "  gc〔垃圾回收〕(Garbage Collection)", "㉚" }
      , { "═══  結束  ═══  ", "㉛" }
      -- , { "===========  結束  ===========    ", "㉛" }
      , { "", "㉜" }
      , { "", "㉝" }
      , { "", "㉞" }
      , { "", "㉟" }
      , { "", "㊱" }
      , { "", "㊲" }
      , { "", "㊳" }
      , { "", "㊴" }
      , { "", "㊵" }
      , { "", "㊶" }
      , { "", "㊷" }
      , { "", "㊸" }
      , { "", "㊹" }
      , { "", "㊺" }
      , { "", "㊻" }
      , { "", "㊼" }
      , { "", "㊽" }
      , { "", "㊾" }
      , { "", "㊿" }
      -- , { "〔夜思‧李白〕", "床前明月光，疑是地上霜。\r舉頭望明月，低頭思故鄉。" }
      }
  env.run_menu_table = run_menu(run_pattern)
  -- log.info("mf_translator Initilized!")
end
----------------------------------------------------------------------------------------
--- @@ mf_translator
--[[
掛載 mf_translator 函數開始
--]]
local function translate(input, seg, env)
  local engine = env.engine
  local context = engine.context
  local caret_pos = context.caret_pos or 0

  --- 精簡程式碼用
  local yield_c = function(cand_text, comment)
    comment = comment == nil and "" or comment
    yield(Candidate("mf_t", seg.start, seg._end, cand_text, comment))
  end

  if seg:has_tag("mf_translator") then
  -- if seg:has_tag("mf_translator") and string.match(input, env.prefix) then
  -- if string.match(input, env.prefix) then
  -- local start_key = string.match(input, env.prefix)
  -- if start_key then

    -- local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
    -- local chinese_time = time_description_chinese(os.time())
    -- local All_g, Y_g, M_g, D_g, H_g = lunarJzl(os.date("%Y%m%d%H"))
    -- local ll_1, ll_2, ly_1, ly_2, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
    -- local aptime1, aptime2, aptime3, aptime4, aptime5, aptime6, aptime7, aptime8, aptime0_1, aptime0_2, aptime0_3, aptime0_4, aptime00_1, aptime00_2,  aptime00_3, aptime00_4 = time_out1()
    -- local aptime_c1, aptime_c2, aptime_c3, aptime_c4, ap_5 = time_out2()

--- 擴充模式 \r\n    日期 (年月日) ~d \r\n    年 ~y  月 ~m  日 ~day \r\n    年月 ~ym  月日 ~md \r\n    時間 (時分) ~n   (時分秒) ~t \r\n    日期時間 (年月日時分) ~dn\r\n    日期時間 (年月日時分秒) ~dt
    if (input == env.prefix) then
    -- if input:find("^" .. env.prefix .. "$") then
      -- yield_c( "" , "擴充模式")
      -- yield_c( "║　d〔年月日〕┃   ym〔年月〕┃　md〔月日〕║" , "")
      -- yield_c( "║　　y〔年〕　┃　　m〔月〕 ┃　　dy〔日〕 ║" , "")
      -- yield_c( "║　　　n〔時:分〕　　 ┃　　　t〔時:分:秒〕　║" , "")
      -- yield_c( "║　dn〔年月日 時:分〕  ┃ dt〔年月日 時:分:秒〕║" , "")
      -- yield_c( "║*/*/*〔 * 年 * 月 * 日〕┃　*-*-*〔*年*月*日〕 ║" , "")
      -- yield_c( "║　　*/*〔 * 月 * 日〕   ┃　　 *-*〔*月*日〕　 ║" , "")

      -- yield_c( "┃ f〔年月日〕┇ ym〔年月〕┇ md〔月日〕┇ fw〔年月日週〕┇ mdw〔月日週〕" , "")
      -- yield_c( "┃ y〔年〕┇ m〔月〕┇ d〔日〕┇ w〔週〕┇ n〔時:分〕┇ t〔時:分:秒〕" , "")
      -- yield_c( "┃ fn〔年月日 時:分〕┇ ft〔年月日 時:分:秒〕" , "")
      -- -- yield_c( "┃ fwn〔年月日週 時:分〕┇ fwt〔年月日週 時:分:秒〕" , "")
      -- yield_c( "┃ ○/○/○〔 ○ 年 ○ 月 ○ 日〕┇ ○/○〔 ○ 月 ○ 日〕" , "")
      -- yield_c( "┃ ○-○-○〔○年○月○日〕┇ ○-○〔○月○日〕┇ ○○○〔數字〕" , "")
      -- -- yield_c( "┃ ○○○〔數字〕" , "")

      for k, v in ipairs(env.menu_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《時間日期數字字母》▶"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "/") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [a-z]+〔小寫字母〕")
      cand2.preedit = input .. "\t《小寫字母》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. ";") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [a-z]+〔大寫字母〕")
      cand2.preedit = input .. "\t《大寫字母》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "\'") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [a-z]+〔開頭大寫字母〕")
      cand2.preedit = input .. "\t《開頭大寫字母》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "x") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [0-9a-f]+〔內碼十六進制 Hex〕(Unicode)")
      cand2.preedit = input .. "\t《內碼十六進制》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "u") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [0-9a-f]+〔內碼十六進制 Hex〕(Unicode)")
      cand2.preedit = input .. "\t《內碼十六進制》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "c") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [0-9]+〔內碼十進制 Dec〕")
      cand2.preedit = input .. "\t《內碼十進制》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "o") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [0-7]+〔內碼八進制 Oct〕")
      cand2.preedit = input .. "\t《內碼八進制》▶"
      yield(cand2)
      return
    end

    if (input == env.prefix .. "e") then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "  ~ [0-9a-f]+〔Percent/URL encoding〕")
      cand2.preedit = input .. "\t《Percent/URL encoding》▶"
      yield(cand2)
      return
    end


    -- 各種鍵位說明
    if (input == env.prefix .. "k") then
      local keys_table = {
          { "  ~k 〔快捷鍵 說明〕", "⓵" }
        , { "  ~o 〔操作鍵 說明〕", "⓶" }
        , { "  ~h 〔韓文 HNC 說明〕(注音系列)", "⓷" }
        , { "  ~s 〔韓文 洋蔥形碼 說明〕(形碼系列)", "⓸" }
        , { "  ~j 〔日文 羅馬字 說明〕", "⓹" }
        , { "  ~i 〔拉丁 IPA國際音標 說明〕", "⓺" }
        , { "  ~p 〔拉丁 KK/DJ/IPA音標 說明〕", "⓻" }
        , { "═══  結束  ═══  ", "⓼" }
        -- , { "===========  結束  ===========    ", "⓼" }
        , { "", "⓽" }
        , { "", "⓾" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《各種鍵位說明》▶"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "ko") then
      -- local keys_table = hotkeys(env.schema_id)[1]
      -- for k, v in ipairs(keys_table) do
      for k, v in ipairs(hotkeys(env.schema_id)[1]) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《操作鍵 說明》"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "kk") then
      -- local keys_table = hotkeys(env.schema_id)[2]
      -- for k, v in ipairs(keys_table) do
      for k, v in ipairs(hotkeys(env.schema_id)[2]) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《快捷鍵 說明》"
        yield(cand)
      end
      return
    end

    -- if (input == env.prefix .. "kk") then
    --   local keys_table = {
    --       { "  h〔韓文 HNC 鍵位〕", "⁰" }
    --     , { "  s〔韓文 洋蔥形碼 鍵位〕", "¹" }
    --     }
    --   for k, v in ipairs(keys_table) do
    --     local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
    --     cand.preedit = input .. "\t《韓文鍵位》▶"
    --     yield(cand)
    --   end
    --   return
    -- end

    if (input == env.prefix .. "kh") then
      local keys_table = {
          { "『 單子音 』", "🄀" }
        , { "　ㄱ g 　ㄷ d      　ㅂ b     　ㅅ s 　ㅇ x (ng)　", "⒈" }
        , { "　ㅋ k 　ㅌ t       　ㅍ p (f)　ㅈ j 　ㅎ h　", "⒉" }
        , { "　ㄴ n 　ㄹ L (r) 　ㅁ m    　ㅊ c　", "⒊" }
        , { "『 雙子音 』", "⒋" }
        , { "　ㄲ gg　ㄸ dd　ㅃ bb　ㅆ ss　ㅉ jj　", "⒌" }
        , { "『 單母音 』", "⒍" }
        , { "　ㅣ i   　ㅏ a  　ㅑ ya　", "⒎" }
        , { "　ㅡ w 　ㅜ u  　ㅠ yu　", "⒏" }
        , { "　　     　ㅓ e  　ㅕ ye　", "⒐" }
        , { "　　     　ㅗ o  　ㅛ yo　", "⒑" }
        , { "『 雙母音 』", "⒒" }
        , { "　ㅐ ai 　ㅒ yai 　ㅘ oa  　ㅝ ue　", "⒓" }
        , { "　ㅔ ei 　ㅖ yei 　ㅙ oai 　ㅞ uei　", "⒔" }
        , { "　　    　　        　ㅚ oi    　ㅟ ui 　ㅢ wi　", "⒕" }
        , { "────────────  ", "⒖" }
        -- , { "------------------------------", "⒖" }
        , { "※  i ↔ y 可互換　", "⒗" }
        , { "────────────  ", "⒘" }
        -- , { "------------------------------", "⒘" }
        , { "", "⒙" }
        , { "", "⒚" }
        , { "", "⒛" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《韓文 HNC 說明》"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "ks") then
      local keys_table = {
          { "　『 基礎字根 』", "🄁" }
        , { "　　A ㅂ　　B ㅅ　　C ㄷ　　D ㅊ　　E ㅌ　　F ㅑ　　G ㅕ　", "🄂" }
        , { "　　H ㅐ　　I ㅣ　　J ㅓ　　K ㅏ　　L ㄴ　　M ㅛ　　N ㅗ　", "🄃" }
        , { "　　O ㅁ　　P ㅔ　　Q ㅇ　　R ㅠ　　S ㄹ　　T ㅜ　　U ㅈ　", "🄄" }
        , { "　　V ㅡ　　W ㅎ　　X ㅍ　　Y ㄱ　　Z ㅋ　", "🄅" }
        , { "　　AA ㅃ  /  BB  ㅆ  /  CC ㄸ  /  HH ㅒ  /  PP ㅖ  /  UU ㅉ  /  YY ㄲ　", "🄆" }
        , { "　『 簡速字根 』", "🄇" }
        , { "　　A ㅝ　　D ㅟ　　E ㅘ　　F ㄲ　　G ㄸ/ㄶ　", "🄈" }
        , { "　　H ㅄ　　I ㄿ　　J ㄺ　　K ㅉ/ㄵ　L ㅢ　", "🄉" }
        , { "　　M ㅆ　　N ㄻ　　O ㅒ　　P ㄽ　　Q ㅖ　", "🄊" }
        , { "　R ㅃ/ㄼ　S ㅙ　　T ㄾ　　V ㄳ　　W ㅀ (對調前碼)", "１🄁" }
        , { "　X ㅚ　　Z ㅞ　", "１🄂" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《韓文 洋蔥形碼 說明》"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "kj") then
      local keys_table = {
          { "　『 五十音 』", "０" }
        , { "　　あ/ア a　い/イ i　う/ウ u　え/エ e　お/オ o　", "１" }
        , { "　　か/カ ka　き/キ ki　く/ク ku　け/ケ ke　こ/コ ko　", "２" }
        , { "　　さ/サ sa　し/シ shi (si)　す/ス su　せ/セ se　そ/ソ so　", "３" }
        , { "　　た/タ ta　ち/チ chi (ti)　つ/ツ tsu (tu)　て/テ te　と/ト to　", "４" }
        , { "　　な/ナ na　に/ニ ni　ぬ/ヌ nu　ね/ネ ne　の/ノ no　", "５" }
        , { "　　は/ハ ha　ひ/ヒ hi　ふ/フ fu (hu)　へ/ヘ he　ほ/ホ ho　", "６" }
        , { "　　ま/マ ma　み/ミ mi　む/ム mu　め/メ me　も/モ mo　", "７" }
        , { "　　や/ヤ ya　ゆ/ユ yu　よ/ヨ yo　", "８" }
        , { "　　ら/ラ ra　り/リ ri　る/ル ru　れ/レ re　ろ/ロ ro　", "９" }
        , { "　わ/ワ wa　を/ヲ wo　ん/ン n", "１０" }
        , { "　ゐ/ヰ wi (i/wyi)　ゑ/ヱ we (e/wye)　", "１１" }
        , { "『 濁音和半濁音 』", "１２" }
        , { "　が/ガ ga　ぎ/ギ gi　ぐ/グ gu　げ/ゲ ge　ご/ゴ go　", "１３" }
        , { "　ざ/ザ za　じ/ジ ji (zi)　ず/ズ zu　ぜ/ゼ ze　ぞ/ゾ zo　", "１４" }
        , { "　だ/ダ da　ぢ/ヂ di　づ/ヅ du　で/デ de　ど/ド do　", "１５" }
        , { "　ば/バ ba　び/ビ bi　ぶ/ブ bu　べ/ベ be　ぼ/ボ bo　", "１６" }
        , { "　ぱ/パ pa　ぴ/ピ pi　ぷ/プ pu　ぺ/ペ pe　ぽ/ポ po　", "１７" }
        , { "　ヷ va　ヸ vi　ゔ/ヴ vu　ヹ ve　ヺ vo　", "１８" }
        , { "『 小寫 』", "１９" }
        , { "　ぁ/ァ xa　ぃ/ィ xi　ぅ/ゥ xu　ぇ/ェ xe　ぉ/ォ xo　", "２０" }
        , { "　っ/ッ xtu (xtsu)　ゎ/ヮ xwa　", "２１" }
        , { "　ゃ/ャ xya　ゅ/ュ xyu　ょ/ョ xyo　", "２２" }
        , { "　ゕ/ヵ xka (ヵ=ka)　ゖ/ヶ xke (ヶ=ke/ga)　", "２３" }
        , { "『 拗音 』", "２４" }
        , { "　きゃ/キャ kya　きゅ/キュ kyu　きょ/キョ kyo　", "２５" }
        , { "　ぎゃ/ギャ gya　ぎゅ/ギュ gyu　ぎょ/ギョ gyo　", "２６" }
        , { "　しゃ/シャ sha (sya)　しゅ/シュ shu (syu)　しょ/ショ sho (syo)　", "２７" }
        , { "　じゃ/ジャ ja (jya/zya)　じゅ/ジュ ju (jyu/zyu)　じょ/ジョ jo (jyo/zyo)　", "２８" }
        , { "　ぢゃ/ヂャ dya (ja/zya)　ぢゅ/ヂュ dyu (ju/zyu)　ぢょ/ヂョ dyo (jo/zyo)　", "２９" }
        , { "　ちゃ/チャ cha (tya/cya)　ちゅ/チュ chu (tyu/cyu)　ちょ/チョ cho (tyo/cyo)　", "３０" }
        , { "　にゃ/ニャ nya　にゅ/ニュ nyu　にょ/ニョ nyo　", "３１" }
        , { "　ひゃ/ヒャ hya　ひゅ/ヒュ hyu　ひょ/ヒョ hyo　", "３２" }
        , { "　びゃ/ビャ bya　びゅ/ビュ byu　びょ/ビョ byo　", "３３" }
        , { "　ぴゃ/ピャ pya　ぴゅ/ピュ pyu　ぴょ/ピョ pyo　", "３４" }
        , { "　みゃ/ミャ mya　みゅ/ミュ myu　みょ/ミョ myo　", "３５" }
        , { "　りゃ/リャ rya　りゅ/リュ ryu　リョ/りょ ryo　", "３６" }
        , { "════════════  ", "３７" }
        -- , { "==============================", "３７" }
        , { "『 外來語 』", "３８" }
        , { "　いぃ/イィ yi　いぇ/イェ ye　", "３９" }
        , { "　うゅ/ウュ wyu　", "４０" }
        , { "　うぁ/ウァ wha　うぃ/ウィ whi (wi)　うぅ/ウゥ whu　うぇ/ウェ whe (we)　うぉ/ウォ who　", "４１" }
        , { "　ゔぁ/ヴァ va　ゔぃ/ヴィ vi (vyi)　ゔぇ/ヴェ ve (vye)　ゔぉ/ヴォ vo　", "４２" }
        , { "　ゔゃ/ヴャ vya　ゔゅ/ヴュ vyu　ゔょ/ヴョ vyo　", "４３" }
        , { "　ゔぃぇ/ヴィェ vye　", "４４" }
        , { "　くぁ/クァ qwa　くぃ/クィ qwi (qyi)　くぅ/クゥ qwu　くぇ/クェ qwe (qye)　くぉ/クォ qwo　", "４５" }
        , { "　くぁ/クァ/くゎ/クヮ kwa　くぃ/クィ kwi　くぅ/クゥ kwu　くぇ/クェ kwe　くぉ/クォ kwo　", "４６" }
        , { "　くゃ/クャ qya　くゅ/クュ qyu　くょ/クョ qyo　", "４７" }
        , { "　ぐぁ/グァ/ぐゎ/グヮ gwa　ぐぃ/グィ gwi　ぐぅ/グゥ gwu　ぐぇ/グェ gwe　ぐぉ/グォ gwo　", "４８" }
        , { "　きぃ/キィ kyi　きぇ/キェ kye　", "４９" }
        , { "　ぎぃ/ギィ gyi　ぎぇ/ギェ gye　", "５０" }
        , { "　しぃ/シィ syi　しぇ/シェ sye (she)　", "５１" }
        , { "　じぃ/ジィ jyi (zyi)　じぇ/ジェ jye (je zye)　", "５２" }
        , { "　すぁ/スァ swa　すぃ/スィ swi　すぅ/スゥ swu　すぇ/スェ swe　すぉ/スォ swo　", "５３" }
        , { "　すゅ/スュ syu　", "５４" }
        , { "　ずゅ/ズュ zyu　ずぃ/ズィ zwi　ずゎ/ズヮ zwa　", "５５" }
        , { "　ちぃ/チィ cyi (tyi)　ちぇ/チェ che (cye tye)　", "５６" }
        , { "　ぢぃ/ヂィ dyi　ぢぇ/ヂェ dye　", "５７" }
        , { "　てゃ/テャ tha　てぃ/ティ thi　てぇ/テェ the　てょ/テョ tho　", "５８" }
        , { "　てゅ/テュ thu (tyu)　", "５９" }
        , { "　でゃ/デャ dha　でぃ/ディ dhi　でぇ/デェ dhe　でょ/デョ dho　", "６０" }
        , { "　でゅ/デュ dhu (dyu)　", "６１" }
        , { "　つぁ/ツァ tsa　つぃ/ツィ tsi　つぇ/ツェ tse　つぉ/ツォ tso　", "６２" }
        , { "　つゅ/ツュ tsyu　", "６３" }
        , { "　とぁ/トァ twa　とぃ/トィ twi　とぅ/トゥ twu　とぇ/トェ twe　とぉ/トォ two　", "６４" }
        , { "　どぁ/ドァ dwa　どぃ/ドィ dwi　どぅ/ドゥ dwu　どぇ/ドェ dwe　どぉ/ドォ dwo　", "６５" }
        , { "　にぃ/ニィ nyi　にぇ/ニェ nye　", "６６" }
        , { "　ひぃ/ヒィ hyi　ひぇ/ヒェ hye　", "６７" }
        , { "　びぃ/ビィ byi　びぇ/ビェ bye　", "６８" }
        , { "　びゎ/ビヮ bwa　", "６９" }
        , { "　ぴぃ/ピィ pyi　ぴぇ/ピェ pye　", "７０" }
        , { "　ふぁ/ファ fwa (fa)　ふぃ/フィ fwi (fi fyi)　ふぅ/フゥ fwu　ふぇ/フェ fwe (fe fye)　ふぉ/フォ fwo (fo)　", "７１" }
        , { "　ふゃ/フャ fya　ふゅ/フュ fyu　ふょ/フョ fyo　", "７２" }
        , { "　ふぃぇ/フィェ fye　", "７３" }
        , { "　ぷゎ/プヮ pwa　", "７４" }
        , { "　ほぅ/ホゥ hwu　", "７５" }
        , { "　みぃ/ミィ myi　みぇ/ミェ mye　", "７６" }
        , { "　りぃ/リィ ryi (lyi)　りぇ/リェ rye (lye)　", "７７" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《日文 羅馬字 說明》"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "ki") then
      local keys_table = {
          { "  ※  (…) 內為編碼，前為 IPA 字符", "⁰" }
        , { "  ※ 「;」→ 大寫，「''」→ 組合附加符號（注音方案改「;;」）", "¹" }
        , { "  ════════════  ", "²" }
        -- , { "  ==============================", "²" }
        , { "  『 母音/元音 』", "³" }
        , { "  　　 ｜     前     ┊     央     ┊     後     ｜", "⁴" }
        , { "  閉　 ｜ i(i)　y(y) ┊ ɨ(it)　ʉ(ut) ┊ ɯ(mq)　u(u) ｜", "⁵" }
        , { "  次閉 ｜ ɪ(ii;)　ʏ(yi;) ┊  ┊ ʊ(wk) ｜", "⁶" }
        , { "  半閉 ｜ e(e)　ø(ox) ┊ ɘ(ek) ɵ(qi) ┊ ɤ(vo/yo/oy)　o(o) ｜", "⁷" }
        , { "  中　 ｜ 　 ┊ ə(eq) ┊ 　 ｜", "⁸" }
        , { "  半開 ｜ ɛ(ei)　œ(ohe) ┊ ɜ(zi)　ɞ(bf) ┊ ʌ(li/vk)　ɔ(jf/ck) ｜", "⁹" }
        , { "次開 ｜ æ(ahe) ┊ ɐ(aq) ┊ 　 ｜", "¹⁰" }
        , { "開　 ｜ a(a)　ɶ(ohe;) ┊  ┊ ɑ(ai)　ɒ(aq) ｜", "¹¹" }
        , { "════════════  ", "¹²" }
        -- , { "==============================", "¹²" }
        , { "『 子音/輔音（肺部氣流音） 』", "¹³" }
        , { "塞音：p(p)　b(b)　t(t)　d(d)　ʈ(ti/tc)　ɖ(dc/dt)　c(c)", "¹⁴" }
        , { "　　　ɟ(jt)　k(k)　ɡ(gi)　q(q)　ɢ(gi;)　ʔ(jfy/jy/jfk)", "¹⁵" }
        , { "鼻音：m(m)　ɱ(mj)　n(n)　ɳ(nc)　ɲ(nj)　ŋ(nj)　ɴ(ni;)", "¹⁶" }
        , { "顫音：ʙ(bi;)　r(r)　ʀ(ri;/ihr;)", "¹⁷" }
        , { "閃音：ⱱ(vr)　ɾ(jq/lfk)　ɽ(rc)", "¹⁸" }
        , { "擦音：ɸ(fi)　β(bi)　f(f)　v(v)　θ(qi)　ð(dfx/dx/dt)", "¹⁹" }
        , { "　　　s(s)　z(z)　ʃ(sf)　ʒ(zf)　ʂ(sc)　ʐ(zc)　ç(cj)", "²⁰" }
        , { "　　　ʝ(jg/ig)　x(x)　ɣ(vo/no/go)　χ(xi)", "²¹" }
        , { "　　　ʁ(rk;)　ħ(ht)　ʕ(cfy/cy/cfk)　h(h)　ɦ(hr)", "²²" }
        , { "邊擦音：ɬ(lk/ik)　ɮ(lzf/lhzf)", "²³" }
        , { "近音：ʋ(vf/yi)　ɹ(rq)　ɻ(rrq/rqc)", "²⁴" }
        , { "　　　j(j)　ɰ(xf/mqy/mrq/wy/whi/uhu)", "²⁵" }
        , { "邊近音：l(l)　ɭ(lc)　ʎ(yq)　ʟ(li;)", "²⁶" }
        , { "════════════  ", "²⁷" }
        -- , { "==============================", "²⁷" }
        , { "『 子音/輔音（非肺部氣流音） 』", "²⁸" }
        , { "搭嘴音：ʘ(oma)　ǀ(iw)　ǃ(ifk)　ǂ(itt/ltt/nfq/iwtt/tft)　ǁ(iwiw)", "²⁹" }
        , { "內爆音：ɓ(br/gq)　ɗ(dr)　ʄ(sft/sftt)　ɠ(gr)　ʛ(gr;)", "³⁰" }
        , { "擠喉音：ʼ(dw)　pʼ(p)(dw)　tʼ(t)(dw)　kʼ(k)(dw)　sʼ(s)(dw)", "³¹" }
        , { "════════════  ", "³²" }
        -- , { "==============================", "³²" }
        , { "『 其他記號 』", "³³" }
        , { "　ʍ(wk)　w(w)　ɥ(hq/ui)　ʜ(hi;)", "³⁴" }
        , { "　ʢ(cfyt/cyt/cfkt/cftf)　ʡ(jfyt/jyt/jfkt/jftf)", "³⁵" }
        , { "　ɕ(cg/gfq)　ʑ(zg)　ɻ(rrq/rqc)　ɧ(hrj/hjr/jqg/hrc/hcr)", "³⁶" }
        , { "　ts͜(t)(s)(du'')　kp͡(k)(p)(m'')", "³⁷" }
        , { "════════════  ", "³⁸" }
        -- , { "==============================", "³⁸" }
        , { "『 變音符號 』", "³⁹" }
        , { "　◌̥(do'') ˳(dow)　◌̬(dv'') ˬ(dvw)　◌ͪ(hh'') ʰ(hh)", "⁴⁰" }
        , { "　◌̹(dj'') ˒(djw/jw)　◌̜(dc'') ˓(dcw/cw)　◌̟(dt'') ˖(dtw/tw/dtfh)", "⁴¹" }
        , { "　◌̠(de'') ˍ(dew) ˗(dew/ew)　◌̈(b'') ¨(bw)　◌̽(x'') ˟(xw) ˣ(xh)", "⁴²" }
        , { "　◌̩(dp'') ˌ(dpw/yw/dyw)　◌̯(dm'')", "⁴³" }
        , { "　˞(kw) ɚ(eqk) ɝ(zk/zr) a˞(a)(kw)", "⁴⁴" }
        , { "　◌̤(db'')　◌̰(ds'') ˷(dsw)　◌̼(dy'')", "⁴⁵" }
        , { "　ʷ(wh)　ʲ(jh)　ˠ(voh/noh/goh)　ˤ(cfyh/cfkh/cyh)", "⁴⁶" }
        , { "　◌̪(dr'')　◌̺(drk'')　◌̻(do'')　◌̃(s'') ˜(sw)　ⁿ(nh)　ˡ(lh)", "⁴⁷" }
        , { "　◌̚(gk'') ˺(gwk)　◌̴(z'') ~(sw) ɫ(lz/iz) ᵶ(zz)", "⁴⁸" }
        , { "　◌̝(dtk'') ˔(dtwk/twk)　◌̞(dt'') ˕(dtw/tw)　◌̘(dtq'')　◌̙(dtq'')", "⁴⁹" }
        , { "════════════  ", "⁵⁰" }
        -- , { "==============================", "⁵⁰" }
        , { "『 超音段成分 』", "⁵¹" }
        , { "　ˈ(pw)　ˌ(dpw/yw/dyw)　ː(dfkdf/dkd/dfdf/dfhdf)　ˑ(dfk/dk/df)", "⁵²" }
        , { "　◌̆(u'') ˘(uw/ufh)　|(iw)　‖(iwiw)", "⁵³" }
        , { "　.(daw) ·(aw)　‿(duw) ◌͜(du/dufh'')", "⁵⁴" }
        , { "────────────  ", "⁵⁵" }
        -- , { "------------------------------", "⁵⁵" }
        , { "『 音階和音調 』", "⁵⁶" }
        , { "　◌̋(pp'') ˝(pwpw)　◌́(p'') ˊ(pw)　◌̄(e'') ˉ(ew)", "⁵⁷" }
        , { "　◌̀(n'') ˋ(nw)　◌̏(n'')", "⁵⁸" }
        , { "　˥(gwk)　˦(twq)　˧(twq)　˨(twq)　˩(gwq)", "⁵⁹" }
        , { "　◌̌(v'') ˇ(vw)　◌̂(l'') ˆ(lw)", "⁶⁰" }
        , { "　ꜜ(lwk)　ꜛ(lw)　↗(lwq)　↘(lwq)", "⁶¹" }
        , { "════════════  ", "⁶²" }
        -- , { "==============================", "⁶²" }
        -- , { "", "⁶³" }
        , { "〔資料來源〕", "https://www.internationalphoneticassociation.org/IPAcharts/IPA_chart_orig/pdfs/IPA_Kiel_2020_full.pdf" }
        -- 以下中文 Wiki 內容較多，但較雜！
        -- , { "　閉：i(i) y(y)｜ɨ(it) ʉ(ut)｜ɯ(mq) u(u)", "³" }
        -- , { "次閉：　ɪ(ii;) ʏ(yi;)　ɨ̞(it)(dt@) ʉ̞(ut)(dt@)　ɯ̞(mq)(dt@) ʊ(wk)", "⁴" }
        -- , { "半閉：e(e) ø(ox)｜ɘ(ek) ɵ(qi)｜ɤ(vo/yo/oy) o(o)", "⁵" }
        -- , { "　中：e̞(e)(dt@) ø̞(ox)(dt@)｜ə(eq)｜ɤ̞(vo/yo/oy)(dt@) o̞(o)(dt@)", "⁶" }
        -- , { "半開：ɛ(ei) œ(ohe)｜ɜ(zi) ɞ(bf)｜ʌ(li/vk) ɔ(jf/ck)", "⁷" }
        -- , { "次開：æ(ahe)｜ɐ(aq)｜", "⁸" }
        -- , { "　開：a(a) ɶ(ohe;)｜ä(ab) ɒ̈(aq)(b@)｜ɑ(ai) ɒ(aq)", "⁹" }
        -- , { "｢肺部氣流音｣：", "¹⁰" }
        -- , { "鼻音：m̥(m)(do@) m(m) ɱ(mj) n̼(n)(dy@) n̥(n)(do@) n(n) ɳ̊(nc)(o@) ɳ(nc) ɲ̊(nj)(o@) ɲ(nj) ŋ̊(nj)(o@) ŋ(nj) ɴ(ni;)", "¹¹" }
        -- , { "塞音：p(p) b(b) p̪(p)(dr@) b̪(b)(dr@) t̼(t)(dy@) d̼(d)(dy@) t(t) d(d) ʈ(ti/tc) ɖ(dc/dt) c(c) ɟ(jt) k(k) ɡ(gi) q(q) ɢ(gi;) ʡ(jfyt/jyt/jfkt/jftf) ʔ(jfy/jy/jfk)", "¹²" }
        -- , { "有噝塞擦音：", "¹³" }
        -- , { "無噝塞擦音：", "¹⁴" }
        -- , { "有噝擦音：", "¹⁵" }
        -- , { "無噝擦音：", "¹⁶" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《拉丁 IPA國際音標 說明》"
        yield(cand)
      end
      return
    end

    if (input == env.prefix .. "kp") then
      local keys_table = {
          { "  ※  […] 內為音標字符，(…) 內為編碼", "₀" }
        , { "  ════════════  ", "₁" }
        -- , { "  ==============================", "₁" }
        , { "  　  KK   ┊   DJ   ┊   IPA   ┃ 單字示例", "₂" }
        , { "  ════════════  ", "₃" }
        -- , { "  ==============================", "₃" }
        , { "  『 單母音/單元音 』", "₄" }
        , { "  　[i] (i) ┊ [iː] (i)(dfkdf/dkd/dfdf/dfhdf) ┊ [iː] ┃ seat", "₅" }
        , { "  　[ɪ] (ii;) ┊ [ɪ] ┊ [ɪ] ┃ sit", "₆" }
        , { "  　[e] (e) ┊ [eɪ] (e)(ii;) ┊ [eɪ] ┃ pain", "₇" }
        , { "  　[ɛ] (ei) ┊ [e] (e) ┊ [e] ┃ head ", "₈" }
        , { "  　[æ] (ahe) ┊ [æ] ┊ [æ] ┃ fat", "₉" }
        , { "　[ɑ] (ai) ┊ [ɑː] (ai)(dfkdf/dkd/dfdf/dfhdf) ┊ [ɑ] ┃ hot", "₁₀" }
        , { "　[o] (o) ┊ [əʊ] (eq)(wk) ┊ [əʊ] ┃ nose", "₁₁" }
        , { "　[ɔ] (jf/ck) ┊ [ɔː] (jf/ck)(dfkdf/dkd/dfdf/dfhdf) ┊ [ɔː] ┃ four", "₁₂" }
        , { "　[ɔ] (jf/ck) ┊ [ɔ] ┊ [ɒ] (aq) ┃ dog", "₁₃" }
        , { "　[u] (u) ┊ [uː] (u)(dfkdf/dkd/dfdf/dfhdf) ┊ [uː] ┃ too", "₁₄" }
        , { "　[ᴜ] (ui;) ┊ [ʊ] (wk) ┊ [ʊ] ┃ put", "₁₅" }
        , { "　[ʌ] (li/vk) ┊ [ʌ] ┊ [ʌ] ┃ sun", "₁₆" }
        , { "　[ə] (eq) ┊ [ə] ┊ [ə] ┃ again", "₁₇" }
        , { "　[ɪr] (ii;)(r) ┊ [ɪə] (ii;)(eq) ┊ [ɪə] ┃ rear", "₁₈" }
        , { "　[ɚ] (eqk) ┊ [ə] (eq) ┊ [ə˞] (eq)(kw) ┃ brother", "₁₉" }
        , { "　[ɝ] (zk/zr) ┊ [ɜ] (zi) ┊ [ɜ˞] (zi)(kw) ┃ bird ", "₂₀" }
        , { "────────────  ", "₂₁" }
        -- , { "------------------------------", "₂₁" }
        , { "『 雙母音/雙元音 』", "₂₂" }
        , { "　[aɪ] (a)(ii;) ┊ [aɪ] ┊ [aɪ] ┃ pie", "₂₃" }
        , { "　[aᴜ] (a)(ui;) ┊ [aʊ] (a)(wk) ┊ [aʊ] ┃ house", "₂₄" }
        , { "　[ɔɪ] (jf/ck)(ii;) ┊ [ɔɪ] ┊ [ɔɪ] ┃ coin", "₂₅" }
        , { "════════════  ", "₂₆" }
        -- , { "==============================", "₂₆" }
        , { "『 子音/輔音（清音）』", "₂₇" }
        , { "　[p] (p) ┊ [p] ┊ [p] ┃ pet", "₂₈" }
        , { "　[t] (t) ┊ [t] ┊ [t] ┃ ten", "₂₉" }
        , { "　[k] (k) ┊ [k] ┊ [k] ┃ key ", "₃₀" }
        , { "　[f] (f) ┊ [f] ┊ [f] ┃ fat ", "₃₁" }
        , { "　[s] (s) ┊ [s] ┊ [s] ┃ sing", "₃₂" }
        , { "　[θ] (qi) ┊ [θ] ┊ [θ] ┃ thank", "₃₃" }
        , { "　[ʃ] (sf) ┊ [ʃ] ┊ [ʃ] ┃ short", "₃₄" }
        , { "　[tʃ] (t)(sf) ┊ [tʃ] ┊ [tʃ] ┃ chair", "₃₅" }
        , { "　[h] (h) ┊ [h] ┊ [h] ┃ ha", "₃₆" }
        -- , { "------------------------------", "₃₇" }
        , { "────────────  ", "₃₇" }
        , { "『 子音/輔音（濁音）』", "₃₈" }
        , { "　[b] (b) ┊ [b] ┊ [b] ┃ book", "₃₉" }
        , { "　[d] (d) ┊ [d] ┊ [d] ┃ desk", "₄₀" }
        , { "　[g] (g) ┊ [g] ┊ [ɡ] (gi) ┃ get", "₄₁" }
        , { "　[v] (v) ┊ [v] ┊ [v] ┃ vest", "₄₂" }
        , { "　[z] (z) ┊ [z] ┊ [z] ┃ zoo", "₄₃" }
        , { "　[ð] (dfx/dx/dt) ┊ [ð] ┊ [ð] ┃ this", "₄₄" }
        , { "　[ʒ] (zf) ┊ [ʒ] ┊ [ʒ] ┃ measure", "₄₅" }
        , { "　[dʒ] (d)(zf) ┊ [dʒ] ┊ [dʒ] ┃ john", "₄₆" }
        , { "　[m] (m) ┊ [m] ┊ [m] ┃ mom", "₄₇" }
        , { "　[n] (n) ┊ [n] ┊ [n] ┃ nose", "₄₈" }
        , { "　[ŋ] (nj) ┊ [ŋ] ┊ [ŋ] ┃ sing", "₄₉" }
        , { "　[l] (l) ┊ [l] ┊ [l] ┃ long", "₅₀" }
        , { "　[r] (r) ┊ [r] ┊ [r] ┃ red", "₅₁" }
        , { "　[j] (j) ┊ [j] ┊ [j] ┃ yes", "₅₂" }
        , { "　[w] (w) ┊ [w] ┊ [w] ┃ we", "₅₃" }
        , { "════════════  ", "₅₄" }
        -- , { "==============================", "₅₄" }
        , { "『 重音和次重音 』（補充）", "₅₅" }
        , { "　[ ˋ ] (nw) ┊ [ ˋ ] ┊ [ ˈ ] (pw) ┃ pencil", "₅₆" }
        , { "　[ ˏ ] (dpw/dnw) ┊ [ ˏ ] ┊ [ ˌ ] (dpw/yw/dyw) ┃ education", "₅₇" }
        , { "　※ 奇摩字典 KK 和 DJ 次重音用〔希臘小寫數字標記〕字符：", "₅₈" }
        , { "　　  [ ͵ ] ，須用希臘掛接方案 (啟始鍵+dpw) 輸入。", "₅₉" }
        , { "════════════  ", "₆₀" }
        -- , { "==============================", "₆₀" }
        , { "〔資料來源〕", "https://zh.wikipedia.org/wiki/KK%E9%9F%B3%E6%A8%99" }
        }
      for k, v in ipairs(keys_table) do
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《拉丁 KK/DJ/IPA音標 說明》"
        yield(cand)
      end
      return
    end


    -- 快捷開啟（開啟檔案/程式/網站）
    if (input == env.prefix .. "j") then
      -- local keys_table = {
      --     { "※ 限起始輸入，限英文 [a-z]+  ", "⓿" }  -- ≤ 2
      --   , { "※ 編輯後須「重新部署」生效  ", "❶" }  --  "────────────  "
      --   , { "  ~t   〔 編輯 快捷開啟 table 〕", "❷" }
      --   , { "  ~c   〔 編輯 custom 短語 〕", "❸" }
      --   , { "  ~r   〔 Rime 官方 GitHub 〕", "❹" }
      --   , { "  ~rw 〔 Rime 詳解 〕", "❺" }
      --   , { "  ~l   〔 librime-lua 官方 GitHub 〕", "❻" }
      --   , { "  ~lw 〔 librime-lua 腳本開發指南 〕", "❼" }
      --   , { "  ~o   〔 Onion 洋蔥 GitHub 〕", "❽" }
      --   , { "  ~ow 〔 Onion 洋蔥 GitHub Wiki 〕", "❾" }
      --   , { "═══  結束  ═══  ", "❿" }
      --   , { "", "⓫" }
      --   , { "", "⓬" }
      --   , { "", "⓭" }
      --   , { "", "⓮" }
      --   , { "", "⓯" }
      --   , { "", "⓰" }
      --   , { "", "⓱" }
      --   , { "", "⓲" }
      --   , { "", "⓳" }
      --   , { "", "⓴" }
      --   }

      -- local keys_table = run_menu(run_pattern)  -- 不用 init 引入，直接引入
      -- for k, v in ipairs(keys_table) do
      for k, v in ipairs(env.run_menu_table) do -- init 引入
        local cand = Candidate("tips", seg.start, seg._end, v[2], " " .. v[1])
        cand.preedit = input .. "\t《快捷開啟》▶"
        yield(cand)
      end
      return
    end

    local op_check = string.match(input, env.prefix .. "j([a-z]+)$")
    local first_check = caret_pos - #input
    if op_check and first_check ~= 0 then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "〔非起始輸入〕")
      cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
      yield(cand2)
      return
    elseif op_check == "t" then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "〘 編輯 快捷開啟 table 〙")  -- or〔錯誤〕
      cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
      yield(cand2)
      return
    elseif op_check == "c" and env.prefix == "`" then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "〔無短語功能〕")  -- or〔錯誤〕
      cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
      yield(cand2)
      return
    elseif op_check == "c" then
      local cand2 = Candidate("tips", seg.start, seg._end, "", "〘 編輯 custom 短語 〙")  -- or〔錯誤〕
      cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
      yield(cand2)
      return
    elseif op_check and first_check == 0 then
      local run_in = run_pattern[ op_check ]
      if run_in ~= nil then
        local cand2 = Candidate("tips", seg.start, seg._end, "", "〘 " .. run_in.name .. " 〙")  -- or〔錯誤〕
        cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
        yield(cand2)
      return
      elseif run_in == nil then
        local cand2 = Candidate("tips", seg.start, seg._end, "", "〔無〕")  -- 〔無此開啟碼〕or〔錯誤〕
        cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
        yield(cand2)
        return
      end
    -- elseif op_check == "fc" then
    --   local cand2 = Candidate("tips", seg.start, seg._end, "", "〔無短語功能〕")  -- or〔錯誤〕
    --   cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
    --   yield(cand2)
    --   return
    -- elseif op_check and first_check == 0 then
    -- -- if (input == env.prefix .. "opp" ) then
    --   local cand2 = Candidate("tips", seg.start, seg._end, "", "〔無此開啟碼〕")  -- or〔錯誤〕
    --   cand2.preedit = env.prefix .. "j " .. op_check .. "\t《快捷開啟》"
    --   yield(cand2)
    --   return
    end


    -- 版本資訊
    if (input == env.prefix .. "v") then
      yield_c( Ver_info(env)[1], "〔 distribution_version 〕")
      yield_c( Ver_info(env)[2], "〔 rime_version 〕")
      yield_c( Ver_info(env)[3], "〔 librime-lua_version 〕")
      yield_c( Ver_info(env)[4], "〔 lua_version 〕")
      yield_c( Ver_info(env)[5], "〔 installation_id 〕")
      --- 記憶體回收，上方可能讓記憶暴漲，故增 collectgarbage。
      -- collectgarbage()  -- 強制進行垃圾回收
      -- collectgarbage("collect")  -- 做一次完整的垃圾收集循環
      return
    end

    -- lua 所佔垃圾/記憶體(Garbage)
    if (input == env.prefix .. "g") then
      yield_c( ("%.f"):format(collectgarbage("count")) .." KB", "〔 the amount of Lua memory 〕")
      return
    end

    -- 垃圾回收器(Garbage Collection)
    if (input == env.prefix .. "gc") then
      yield_c( ("%.f"):format(collectgarbage("count")) .." KB", "〔 the amount of Lua memory before GC 〕")
      -- yield_c( ("%.f"):format(collectgarbage("count")*1024) .." Bytes", "〔 the amount of lua memory before GC 〕")
      -- yield_c( collectgarbage("count") .." KB", "〔 the amount of lua memory before GC 〕")
      -- yield_c( collectgarbage("count")*1024, "〔 the amount of lua memory before GC 〕")
      collectgarbage()  -- 強制進行垃圾回收
      -- collectgarbage("collect")  -- 做一次完整的垃圾收集循環
      yield_c( ("%.f"):format(collectgarbage("count")) .." KB", "〔 the amount of Lua memory after GC 〕")
      -- yield_c( ("%.f"):format(collectgarbage("count")*1024) .." Bytes", "〔 the amount of lua memory after GC 〕")
      -- yield_c( collectgarbage("count") .." KB", "〔 the amount of lua memory after GC 〕")
      -- yield_c( collectgarbage("count")*1024, "〔 the amount of lua memory after GC 〕")
      return
    end

    -- lua 程式原生時間
    if (input == env.prefix .. "p") then
      yield_c( os.date(), "〔 os.date() 〕")
      yield_c( os.time(), "〔 os.time()，當前距 1970.1.1.08:00 秒數〕")
      return
    end

    -- Candidate(type, start, end, text, comment)
    if (input == env.prefix .. "t") then
      -- yield_c( os.date("%H:%M"), "〔時:分〕 ~m")
      -- yield_c( os.date("%H:%M:%S"), "〔時:分:秒〕 ~d")
      yield_c( string.gsub(os.date("%H:%M:%S"), "^0", ""), "〔時:分:秒〕 ~d")
      -- local a, b, c, d, aptime5, aptime6, aptime7, aptime8 = time_out1()
      yield_c( time_out1()[6] , "〔時:分:秒〕 ~m")
      yield_c( string.gsub(os.date("%H時%M分%S秒"), "0([%d])", "%1"), "〔時:分:秒〕 ~c")
      -- local a, b, aptime_c3, aptime_c4, ap_5 = time_out2()
      yield_c( string.gsub(time_out2()[7], " 0([%d])", " %1"), "〔時:分:秒〕 ~s")
      yield_c( string.gsub(time_out2()[3], "0([%d])", "%1"), "〔時:分:秒〕 ~w")
      yield_c( ch_h_date(os.date("%H")).."時"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕 ~z")
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."時"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕 ~u")
      return
    end

    if (input == env.prefix .. "ts") then
      -- local a, b, aptime_c3, aptime_c4 = time_out2()
      yield_c( string.gsub(time_out2()[7], " 0([%d])", " %1"), "〔時:分:秒〕")
      yield_c( time_out2()[5].." "..fullshape_number(string.gsub(os.date("%I"), "^0", "")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔時:分:秒〕")
      yield_c( time_out2()[7], "〔時:分:秒〕")
      yield_c( time_out2()[5].." "..fullshape_number(os.date("%I")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "tw") then
      -- local a, b, aptime_c3, aptime_c4 = time_out2()
      yield_c( string.gsub(time_out2()[3], "0([%d])", "%1"), "〔時:分:秒〕")
      yield_c( string.gsub(time_out2()[4], "0([%d])", "%1"), "〔時:分:秒〕")
      yield_c( fullshape_number(string.gsub(time_out2()[3], "0([%d])", "%1")), "〔時:分:秒〕")
      yield_c( fullshape_number(string.gsub(time_out2()[4], "0([%d])", "%1")), "〔時:分:秒〕")
      yield_c( time_out2()[3], "〔時:分:秒〕")
      yield_c( time_out2()[4], "〔時:分:秒〕")
      yield_c( fullshape_number(time_out2()[3]), "〔時:分:秒〕")
      yield_c( fullshape_number(time_out2()[4]), "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "tu") then
      -- local a, b, aptime_c3, aptime_c4, ap_5 = time_out2()
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."時"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( time_out2()[5].." "..chb_h_date(os.date("%I")).."時"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( time_out2()[5].." "..chb_h_date(os.date("%I")).."點"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "td") then
      yield_c( string.gsub(os.date("%H:%M:%S"), "^0", ""), "〔時:分:秒〕")
      yield_c( fullshape_number(string.gsub(os.date("%H"), "^0", "")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔時:分:秒〕")
      yield_c( os.date("%H:%M:%S"), "〔時:分:秒〕")
      yield_c( fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "tm") then
      -- local a, b, c, d, aptime5, aptime6, aptime7, aptime8, e, f, g, h, aptime00_1, aptime00_2,  aptime00_3, aptime00_4 = time_out1()
      yield_c( time_out1()[6], "〔時:分:秒〕")
      yield_c( time_out1()[8], "〔時:分:秒〕")
      yield_c( time_out1()[7], "〔時:分:秒〕")
      yield_c( time_out1()[5], "〔時:分:秒〕")
      yield_c( time_out1()[14], "〔時:分:秒〕")
      yield_c( time_out1()[16], "〔時:分:秒〕")
      yield_c( time_out1()[15], "〔時:分:秒〕")
      yield_c( time_out1()[13], "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "tc") then
      yield_c( string.gsub(os.date("%H時%M分%S秒"), "0([%d])", "%1"), "〔時:分:秒〕")
      yield_c( string.gsub(os.date("%H點%M分%S秒"), "0([%d])", "%1"), "〔時:分:秒〕")
      yield_c( fullshape_number(string.gsub(os.date("%H時%M分%S秒"), "0([%d])", "%1")), "〔時:分:秒〕")
      yield_c( fullshape_number(string.gsub(os.date("%H點%M分%S秒"), "0([%d])", "%1")), "〔時:分:秒〕")
      yield_c( os.date("%H時%M分%S秒"), "〔時:分:秒〕")
      yield_c( os.date("%H點%M分%S秒"), "〔時:分:秒〕")
      yield_c( fullshape_number(os.date("%H時%M分%S秒")), "〔時:分:秒〕")
      yield_c( fullshape_number(os.date("%H點%M分%S秒")), "〔時:分:秒〕")
      return
    end

    if (input == env.prefix .. "tz") then
      yield_c( ch_h_date(os.date("%H")).."時"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( chb_h_date(os.date("%H")).."時"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      yield_c( chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔時:分:秒〕")
      return
    end

    -- if (input == env.prefix .. "tm") then
    --   yield_c( os.date("%H:%M"), "〔時:分〕")
    --   return
    -- end

    if (input == env.prefix .. "z") then
      -- local tz, tzd = timezone_out()
      yield_c( timezone_out()[1], "〔世界協調時間〕")
      yield_c( timezone_out()[5], "〔格林威治標準時間〕")
      yield_c( timezone_out()[2], "〔本地時區代號〕")
      return
    end

    if (input == env.prefix .. "n") then
      -- yield_c( os.date("%H:%M:%S"), "〔時:分:秒〕 ~s")
      -- yield_c( os.date("%H:%M"), "〔時:分〕 ~d")
      yield_c( string.gsub(os.date("%H:%M"), "^0", ""), "〔時:分〕 ~d")
      -- local aptime1, aptime2, aptime3, aptime4 = time_out1()
      yield_c( time_out1()[2], "〔時:分〕 ~m")
      yield_c( string.gsub(os.date("%H時%M分"), "0([%d])", "%1"), "〔時:分〕 ~c")
      -- local aptime_c1, aptime_c2, a, b, ap_5 = time_out2()
      yield_c( string.gsub(time_out2()[6], " 0([%d])", " %1"), "〔時:分〕 ~s")
      yield_c( string.gsub(time_out2()[1], "0([%d])", "%1"), "〔時:分〕 ~w")
      yield_c( ch_h_date(os.date("%H")).."時"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕 ~z")
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."時"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕 ~u")
      -- local chinese_time = time_description_chinese(os.time())
      yield_c( time_description_chinese(os.time()), "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "ns") then
      -- local aptime_c1, aptime_c2 = time_out2()
      yield_c( string.gsub(time_out2()[6], " 0([%d])", " %1"), "〔時:分〕")
      yield_c( time_out2()[5].." "..fullshape_number(string.gsub(os.date("%I"), "^0", "")).."："..fullshape_number(os.date("%M")), "〔時:分〕")
      yield_c( time_out2()[6], "〔時:分〕")
      yield_c( time_out2()[5].." "..fullshape_number(os.date("%I")).."："..fullshape_number(os.date("%M")), "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nw") then
      -- local aptime_c1, aptime_c2 = time_out2()
      yield_c( string.gsub(time_out2()[1], "0([%d])", "%1"), "〔時:分〕")
      yield_c( string.gsub(time_out2()[2], "0([%d])", "%1"), "〔時:分〕")
      yield_c( fullshape_number(string.gsub(time_out2()[1], "0([%d])", "%1")), "〔時:分〕")
      yield_c( fullshape_number(string.gsub(time_out2()[2], "0([%d])", "%1")), "〔時:分〕")
      yield_c( time_out2()[1], "〔時:分〕")
      yield_c( time_out2()[2], "〔時:分〕")
      yield_c( fullshape_number(time_out2()[1]), "〔時:分〕")
      yield_c( fullshape_number(time_out2()[2]), "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nu") then
      -- local a, b, c, d, ap_5 = time_out2()
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."時"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( time_out2()[5].." "..ch_h_date(os.date("%I")).."點"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( time_out2()[5].." "..chb_h_date(os.date("%I")).."時"..chb_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( time_out2()[5].." "..chb_h_date(os.date("%I")).."點"..chb_minsec_date(os.date("%M")).."分", "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nd") then
      yield_c( string.gsub(os.date("%H:%M"), "^0", ""), "〔時:分〕")
      yield_c( fullshape_number(string.gsub(os.date("%H"), "^0", "")).."："..fullshape_number(os.date("%M")), "〔時:分〕")
      yield_c( os.date("%H:%M"), "〔時:分〕")
      yield_c( fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nm") then
      -- local aptime1, aptime2, aptime3, aptime4 , a, b, c, d, aptime0_1, aptime0_2,  aptime0_3, aptime0_4 = time_out1()
      yield_c( time_out1()[2], "〔時:分〕")
      yield_c( time_out1()[4], "〔時:分〕")
      yield_c( time_out1()[3], "〔時:分〕")
      yield_c( time_out1()[1], "〔時:分〕")
      yield_c( time_out1()[10], "〔時:分〕")
      yield_c( time_out1()[12], "〔時:分〕")
      yield_c( time_out1()[11], "〔時:分〕")
      yield_c( time_out1()[9], "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nc") then
      yield_c( string.gsub(os.date("%H時%M分"), "0([%d])", "%1"), "〔時:分〕")
      yield_c( string.gsub(os.date("%H點%M分"), "0([%d])", "%1"), "〔時:分〕")
      yield_c( fullshape_number(string.gsub(os.date("%H時%M分"), "0([%d])", "%1")), "〔時:分〕")
      yield_c( fullshape_number(string.gsub(os.date("%H點%M分"), "0([%d])", "%1")), "〔時:分〕")
      yield_c( os.date("%H時%M分"), "〔時:分〕")
      yield_c( os.date("%H點%M分"), "〔時:分〕")
      yield_c( fullshape_number(os.date("%H時%M分")), "〔時:分〕")
      yield_c( fullshape_number(os.date("%H點%M分")), "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nz") then
      yield_c( ch_h_date(os.date("%H")).."時"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( chb_h_date(os.date("%H")).."時"..chb_minsec_date(os.date("%M")).."分", "〔時:分〕")
      yield_c( chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分", "〔時:分〕")
      return
    end

    if (input == env.prefix .. "nl") then
      -- local chinese_time = time_description_chinese(os.time())
      yield_c( time_description_chinese(os.time()), "〔農曆〕")
      local All_g, Y_g, M_g, D_g, H_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( H_g.."時", "〔農曆干支〕")
      yield_c( GetLunarSichen(os.date("%H")), "〔農曆時辰〕")
      return
    end

    -- if (input == env.prefix .. "ns") then
    --   yield_c( os.date("%H:%M:%S"), "〔時:分:秒〕")
    --   return
    -- end

    if (input == env.prefix .. "l") then
      -- local Moonshape, Moonangle = Moonphase_out1()
      yield_c( Moonphase_out1()[1], Moonphase_out1()[2])
      -- local p, d = Moonphase_out2()
      yield_c( Moonphase_out2()[1], Moonphase_out2()[2])
      return
    end

    if (input == env.prefix .. "s") then
      local jq_1, jq_2, jq_3 ,jq_4 = jieqi_out1()
      yield_c( jq_1, jq_2)
      yield_c( jq_3, jq_4)
      local nt_jqs = GetNowTimeJq(os.date("%Y%m%d"))
      -- local n_jqsy = GetNextJQ(os.date("%Y"))  -- 會少最近一期節氣
      for i =1,#nt_jqs do
        yield_c( nt_jqs[i], "〔節氣〕")
      end
      local nt_jqs = nil
      return
    end

    if (input == env.prefix .. "f") then
      yield_c( os.date("%Y%m%d"), "〔年月日〕 ~d")
      yield_c( os.date("%Y.%m.%d"), "〔年月日〕 ~p")
      yield_c( os.date("%Y/%m/%d"), "〔年月日〕 ~s")
      yield_c( os.date("%Y-%m-%d"), "〔年月日〕 ~m")
      yield_c( os.date("%Y_%m_%d"), "〔年月日〕 ~u")
      yield_c( string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1"), "〔年月日〕 ~c")
      yield_c( rqzdx1(), "〔中數〕 ~z")
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日", "([^%d])0", "%1"), "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23), "〔民國中數〕 ~g")
      -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")), "〔年月日〕 ~j")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1"), "〔日本元号〕 ~j")
      yield_c( eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d"))..", "..os.date("%Y"), "〔月日年〕 ~a")
      yield_c( eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔日月年〕 ~e")
      -- local chinese_date = to_chinese_cal_local(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ll_1, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "fj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1"), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1")), "〔日本元号〕")
      yield_c( jpymd, "〔日本元号〕")
      yield_c( fullshape_number(jpymd), "〔日本元号〕")
      return
    end
    -- if (input == env.prefix .. "fj") then
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")), "〔年月日〕")
    --   return
    -- end

    if (input == env.prefix .. "fh") then
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日", "([^%d])0", "%1"), "〔民國〕")
      yield_c( string.gsub("民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日", "([^%d])0", "%1"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")), "〔民國〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日", "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日", "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日", "〔民國〕")
      return
    end

    if (input == env.prefix .. "fg") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23), "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年"..rqzdx1(23), "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年"..rqzdx2(23), "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "fl") then
      -- local chinese_date = to_chinese_cal_local(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ll_1, "〔農曆〕")
      yield_c( ll_2, "〔農曆〕")
      local All_g, Y_g, M_g, D_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( Y_g.."年"..M_g.."月"..D_g.."日", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "fa") then
      yield_c( eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d"))..", "..os.date("%Y"), "〔月日年〕")
      yield_c( eng1_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d"))..", "..os.date("%Y"), "〔月日年〕")
      yield_c( eng2_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d"))..", "..os.date("%Y"), "〔月日年〕")
      yield_c( eng3_m_date(os.date("%m")).." "..eng4_d_date(os.date("%d")).." "..os.date("%Y"), "〔月日年〕")
      yield_c( eng1_m_date(os.date("%m")).." the "..eng1_d_date(os.date("%d"))..", "..os.date("%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fe") then
      yield_c( eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔日月年〕")
      yield_c( eng3_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔日月年〕")
      yield_c( eng2_d_date(os.date("%d")).." "..eng2_m_date(os.date("%m")).." "..os.date("%Y"), "〔日月年〕")
      yield_c( "the "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔日月年〕")
      yield_c( "The "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔日月年〕")
      return
    end

    if (input == env.prefix .. "fc") then
      yield_c( string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1"), "〔年月日〕")
      yield_c( string.gsub(os.date(" %Y 年 %m 月 %d 日 "), "([^%d])0", "%1"), "〔*年月日*〕")
      yield_c( fullshape_number(string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1")), "〔年月日〕")
      yield_c( os.date("%Y年%m月%d日"), "〔年月日〕")
      yield_c( os.date(" %Y 年 %m 月 %d 日 "), "〔*年月日*〕")
      yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日", "〔年月日〕")
      return
    end

    if (input == env.prefix .. "fd") then
      yield_c( os.date("%Y%m%d"), "〔年月日〕")
      yield_c( fullshape_number(os.date("%Y"))..fullshape_number(os.date("%m"))..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( os.date("%d%m%Y"), "〔日月年〕")
      yield_c( os.date("%m%d%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fm") then
      yield_c( os.date("%Y-%m-%d"), "〔年月日〕")
      yield_c( fullshape_number(os.date("%Y")).."－"..fullshape_number(os.date("%m")).."－"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( os.date("%d-%m-%Y"), "〔日月年〕")
      yield_c( os.date("%m-%d-%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fs") then
      yield_c( os.date("%Y/%m/%d"), "〔年月日〕")
      -- yield_c( fullshape_number(os.date("%Y")).."/"..fullshape_number(os.date("%m")).."/"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( fullshape_number(os.date("%Y")).."／"..fullshape_number(os.date("%m")).."／"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( os.date("%d/%m/%Y"), "〔日月年〕")
      yield_c( os.date("%m/%d/%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fu") then
      yield_c( os.date("%Y_%m_%d"), "〔年月日〕")
      -- yield_c( fullshape_number(os.date("%Y")).."_"..fullshape_number(os.date("%m")).."_"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( fullshape_number(os.date("%Y")).."＿"..fullshape_number(os.date("%m")).."＿"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( os.date("%d_%m_%Y"), "〔日月年〕")
      yield_c( os.date("%m_%d_%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fp") then
      yield_c( os.date("%Y.%m.%d"), "〔年月日〕")
      -- yield_c( fullshape_number(os.date("%Y")).."."..fullshape_number(os.date("%m")).."."..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( fullshape_number(os.date("%Y")).."．"..fullshape_number(os.date("%m")).."．"..fullshape_number(os.date("%d")), "〔年月日〕")
      yield_c( os.date("%d.%m.%Y"), "〔日月年〕")
      yield_c( os.date("%m.%d.%Y"), "〔月日年〕")
      return
    end

    if (input == env.prefix .. "fz") then
      yield_c( rqzdx1(), "〔中數〕")
      yield_c( rqzdx2(), "〔中數〕")
      return
    end

    if (input == env.prefix .. "fn") then
      yield_c( os.date("%Y%m%d %H:%M"), "〔年月日 時:分〕 ~d")
      yield_c( os.date("%Y.%m.%d %H:%M"), "〔年月日 時:分〕 ~p")
      yield_c( os.date("%Y/%m/%d %H:%M"), "〔年月日 時:分〕 ~s")
      yield_c( os.date("%Y-%m-%d %H:%M"), "〔年月日 時:分〕 ~m")
      yield_c( os.date("%Y_%m_%d %H:%M"), "〔年月日 時:分〕 ~u")
      yield_c( os.date("%Y-%m-%d-%H-%M ") .. timezone_out()[1], "〔本地時  時區〕 ~i")
      yield_c( os.date("%Y-%m-%dT%H:%M") .. timezone_out()[3], "〔本地時  RFC 3339/ISO 8601〕 ~r")
      yield_c( string.gsub(os.date("%Y年%m月%d日 %H點%M分"), "([^%d])0", "%1"), "〔年月日 時:分〕 ~c")
      yield_c( rqzdx1().." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔中數〕 ~z")
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日 "..os.date("%H點%M分"), "([^%d])0", "%1"), "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔民國中數〕 ~g")
      -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..os.date("%H")..":"..os.date("%M"), "〔年月日 時:分〕 ~j")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").." "..os.date("%H:%M"), "〔日本元号〕 ~j")
      -- local chinese_date = to_chinese_cal_local(os.time())
      -- local chinese_time = time_description_chinese(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ll_1 .." ".. time_description_chinese(os.time()), "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "fni") then
      yield_c( os.date("%Y-%m-%d-%H-%M ") .. timezone_out()[1], "〔本地時  時區〕")
      yield_c( os.date("%Y-%m-%d-%H-%M ") .. timezone_out()[5], "〔本地時  時區〕")
      yield_c( os.date("%Y-%m-%d-%H-%M ") .. timezone_out()[2], "〔本地時  時區〕")
      yield_c( os.date("!%Y-%m-%d-%H-%M UTC"), "〔世界時  時區〕")
      yield_c( os.date("!%Y-%m-%d-%H-%M GMT"), "〔世界時  時區〕")
      return
    end

    if (input == env.prefix .. "fnr") then
      yield_c( os.date("%Y-%m-%dT%H:%M") .. timezone_out()[3], "〔本地時  RFC 3339/ISO 8601〕")
      yield_c( os.date("%Y%m%dT%H%M") .. timezone_out()[4], "〔本地時  RFC 3339/ISO 8601〕")
      yield_c( os.date("!%Y-%m-%dT%H:%MZ"), "〔世界時  RFC 3339/ISO 8601〕")
      yield_c( os.date("!%Y%m%dT%H%MZ"), "〔世界時  RFC 3339/ISO 8601〕")
      return
    end

    if (input == env.prefix .. "fnj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").." "..os.date("%H:%M"), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1")).." "..os.date("%H:%M"), "〔日本元号〕")
      yield_c( jpymd.." "..os.date("%H:%M"), "〔日本元号〕")
      yield_c( fullshape_number(jpymd.." "..os.date("%H:%M")), "〔日本元号〕")
      return
    end
    -- if (input == env.prefix .. "fnj") then
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..os.date("%H")..":"..os.date("%M"), "〔年月日 時:分〕")
    --   return
    -- end

    if (input == env.prefix .. "fnh") then
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日 "..os.date("%H點%M分"), "([^%d])0", "%1"), "〔民國〕")
      yield_c( string.gsub("民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日 "..os.date("%H 點 %M 分"), "([^%d])0", "%1"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(string.gsub(os.date("%m月%d日%H點%M分"), "0([%d])", "%1")), "〔民國〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日"..os.date("%H點%M分"), "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日 "..os.date("%H 點 %M 分"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日"..fullshape_number(os.date("%H點%M分")), "〔民國〕")
      return
    end

    if (input == env.prefix .. "fng") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年"..rqzdx2(23).." "..chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分", "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "fnl") then
      -- local chinese_date = to_chinese_cal_local(os.time())
      -- local chinese_time = time_description_chinese(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      local All_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( ll_1 .." ".. time_description_chinese(os.time()), "〔農曆〕")
      yield_c( ll_2 .." ".. time_description_chinese(os.time()), "〔農曆〕")
      yield_c( All_g, "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "fnc") then
      yield_c( string.gsub(os.date("%Y年%m月%d日 %H點%M分"), "([^%d])0", "%1"), "〔年月日 時:分〕")
      yield_c( string.gsub(os.date(" %Y 年 %m 月 %d 日 %H 點 %M 分 "), "([^%d])0", "%1"), "〔*年月日 時:分*〕")
      yield_c( fullshape_number(string.gsub(os.date("%Y年%m月%d日　%H點%M分"), "([^%d])0", "%1")), "〔年月日 時:分〕")
      yield_c( os.date("%Y年%m月%d日 %H點%M分"), "〔年月日 時:分〕")
      yield_c( os.date(" %Y 年 %m 月 %d 日 %H 點 %M 分 "), "〔*年月日 時:分*〕")
      yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日　"..fullshape_number(os.date("%H")).."點"..fullshape_number(os.date("%M")).."分", "〔年月日 時:分〕")
      return
    end

    if (input == env.prefix .. "fnd") then
      yield_c( os.date("%Y%m%d %H:%M"), "〔年月日 時:分〕")
      yield_c( fullshape_number(os.date("%Y"))..fullshape_number(os.date("%m"))..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( os.date("%d%m%Y %H:%M"), "〔日月年 時:分〕")
      yield_c( os.date("%m%d%Y %H:%M"), "〔月日年 時:分〕")
      return
    end

    if (input == env.prefix .. "fns") then
      yield_c( os.date("%Y/%m/%d %H:%M"), "〔年月日 時:分〕")
      -- yield_c( fullshape_number(os.date("%Y")).."/"..fullshape_number(os.date("%m")).."/"..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( fullshape_number(os.date("%Y")).."／"..fullshape_number(os.date("%m")).."／"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( os.date("%d/%m/%Y %H:%M"), "〔日月年 時:分〕")
      yield_c( os.date("%m/%d/%Y %H:%M"), "〔月日年 時:分〕")
      return
    end

    if (input == env.prefix .. "fnm") then
      yield_c( os.date("%Y-%m-%d %H:%M"), "〔年月日 時:分〕")
      yield_c( fullshape_number(os.date("%Y")).."－"..fullshape_number(os.date("%m")).."－"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( os.date("%d-%m-%Y %H:%M"), "〔日月年 時:分〕")
      yield_c( os.date("%m-%d-%Y %H:%M"), "〔月日年 時:分〕")
      return
    end

    if (input == env.prefix .. "fnu") then
      yield_c( os.date("%Y_%m_%d %H:%M"), "〔年月日 時:分〕")
      -- yield_c( fullshape_number(os.date("%Y")).."_"..fullshape_number(os.date("%m")).."_"..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( fullshape_number(os.date("%Y")).."＿"..fullshape_number(os.date("%m")).."＿"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( os.date("%d_%m_%Y %H:%M"), "〔日月年 時:分〕")
      yield_c( os.date("%m_%d_%Y %H:%M"), "〔月日年 時:分〕")
      return
    end

    if (input == env.prefix .. "fnp") then
      yield_c( os.date("%Y.%m.%d %H:%M"), "〔年月日 時:分〕")
      -- yield_c( fullshape_number(os.date("%Y")).."."..fullshape_number(os.date("%m")).."."..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( fullshape_number(os.date("%Y")).."．"..fullshape_number(os.date("%m")).."．"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日 時:分〕")
      yield_c( os.date("%d.%m.%Y %H:%M"), "〔日月年 時:分〕")
      yield_c( os.date("%m.%d.%Y %H:%M"), "〔月日年 時:分〕")
      return
    end

    if (input == env.prefix .. "fnz") then
      yield_c( rqzdx1().." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分", "〔中數〕")
      yield_c( rqzdx2().." "..chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分", "〔中數〕")
      return
    end

    if (input == env.prefix .. "ft") then
      yield_c( os.date("%Y%m%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~d")
      yield_c( os.date("%Y.%m.%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~p")
      yield_c( os.date("%Y/%m/%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~s")
      yield_c( os.date("%Y-%m-%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~m")
      yield_c( os.date("%Y_%m_%d %H:%M:%S"), "〔年月日 時:分:秒〕 ~u")
      yield_c( os.date("%Y-%m-%d-%H-%M-%S ") .. timezone_out()[1], "〔本地時  時區〕 ~i")
      yield_c( os.date("%Y-%m-%dT%H:%M:%S") .. timezone_out()[3], "〔本地時  RFC 3339/ISO 8601〕 ~r")
      yield_c( string.gsub(os.date("%Y年%m月%d日 %H點%M分%S秒"), "([^%d])0", "%1"), "〔年月日 時:分:秒〕 ~c")
      yield_c( rqzdx1().." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔中數〕 ~z")
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日 "..os.date("%H點%M分%S秒"), "([^%d])0", "%1"), "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔民國中數〕 ~g")
      -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..os.date("%H")..":"..os.date("%M")..":"..os.date("%S"), "〔年月日 時:分:秒〕 ~j")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").." "..os.date("%H:%M:%S"), "〔日本元号〕 ~j")
      return
    end

    if (input == env.prefix .. "fti") then
      yield_c( os.date("%Y-%m-%d-%H-%M-%S ") .. timezone_out()[1], "〔本地時  時區〕")
      yield_c( os.date("%Y-%m-%d-%H-%M-%S ") .. timezone_out()[5], "〔本地時  時區〕")
      yield_c( os.date("%Y-%m-%d-%H-%M-%S ") .. timezone_out()[2], "〔本地時  時區〕")
      yield_c( os.date("!%Y-%m-%d-%H-%M-%S UTC"), "〔世界時  時區〕")
      yield_c( os.date("!%Y-%m-%d-%H-%M-%S GMT"), "〔世界時  時區〕")
      return
    end

    if (input == env.prefix .. "ftr") then
      yield_c( os.date("%Y-%m-%dT%H:%M:%S") .. timezone_out()[3], "〔本地時  RFC 3339/ISO 8601〕")
      yield_c( os.date("%Y%m%dT%H%M%S") .. timezone_out()[4], "〔本地時  RFC 3339/ISO 8601〕")
      yield_c( os.date("!%Y-%m-%dT%H:%M:%SZ"), "〔世界時  RFC 3339/ISO 8601〕")
      yield_c( os.date("!%Y%m%dT%H%M%SZ"), "〔世界時  RFC 3339/ISO 8601〕")
      return
    end

    if (input == env.prefix .. "ftj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").." "..os.date("%H:%M:%S"), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1")).." "..os.date("%H:%M:%S"), "〔日本元号〕")
      yield_c( jpymd.." "..os.date("%H:%M:%S"), "〔日本元号〕")
      yield_c( fullshape_number(jpymd.." "..os.date("%H:%M:%S")), "〔日本元号〕")
      return
    end
    -- if (input == env.prefix .. "ftj") then
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..os.date("%H")..":"..os.date("%M")..":"..os.date("%S"), "〔年月日 時:分:秒〕")
    --   return
    -- end

    if (input == env.prefix .. "fth") then
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日 "..os.date("%H點%M分%S秒"), "([^%d])0", "%1"), "〔民國〕")
      yield_c( string.gsub("民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日 "..os.date("%H 點 %M 分 %S 秒"), "([^%d])0", "%1"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(string.gsub(os.date("%m月%d日%H點%M分%S秒"), "0([%d])", "%1")), "〔民國〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日"..os.date("%H點%M分%S秒"), "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日 "..os.date("%H 點 %M 分 %S 秒"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日"..fullshape_number(os.date("%H點%M分%S秒")), "〔民國〕")
      return
    end

    if (input == env.prefix .. "ftg") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年"..rqzdx1(23).." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年"..rqzdx2(23).." "..chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "ftc") then
      yield_c( string.gsub(os.date("%Y年%m月%d日 %H點%M分%S秒"), "([^%d])0", "%1"), "〔年月日 時:分:秒〕")
      yield_c( string.gsub(os.date(" %Y 年 %m 月 %d 日 %H 點 %M 分 %S 秒 "), "([^%d])0", "%1"), "〔*年月日 時:分:秒*〕")
      yield_c( fullshape_number(string.gsub(os.date("%Y年%m月%d日　%H點%M分%S秒"), "([^%d])0", "%1")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%Y年%m月%d日 %H點%M分%S秒"), "〔年月日 時:分:秒〕")
      yield_c( os.date(" %Y 年 %m 月 %d 日 %H 點 %M 分 %S 秒 "), "〔*年月日 時:分:秒*〕")
      yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日　"..fullshape_number(os.date("%H")).."點"..fullshape_number(os.date("%M")).."分"..fullshape_number(os.date("%S")).."秒", "〔年月日 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "ftd") then
      yield_c( os.date("%Y%m%d %H:%M:%S"), "〔年月日 時:分:秒〕")
      yield_c( fullshape_number(os.date("%Y"))..fullshape_number(os.date("%m"))..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%d%m%Y %H:%M:%S"), "〔日月年 時:分:秒〕")
      yield_c( os.date("%m%d%Y %H:%M:%S"), "〔月日年 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "fts") then
      yield_c( os.date("%Y/%m/%d %H:%M:%S"), "〔年月日 時:分:秒〕")
      -- yield_c( fullshape_number(os.date("%Y")).."/"..fullshape_number(os.date("%m")).."/"..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M"))..":"..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( fullshape_number(os.date("%Y")).."／"..fullshape_number(os.date("%m")).."／"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%d/%m/%Y %H:%M:%S"), "〔日月年 時:分:秒〕")
      yield_c( os.date("%m/%d/%Y %H:%M:%S"), "〔月日年 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "ftm") then
      yield_c( os.date("%Y-%m-%d %H:%M:%S"), "〔年月日 時:分:秒〕")
      yield_c( fullshape_number(os.date("%Y")).."－"..fullshape_number(os.date("%m")).."－"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%d-%m-%Y %H:%M:%S"), "〔日月年 時:分:秒〕")
      yield_c( os.date("%m-%d-%Y %H:%M:%S"), "〔月日年 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "ftu") then
      yield_c( os.date("%Y_%m_%d %H:%M:%S"), "〔年月日 時:分:秒〕")
      -- yield_c( fullshape_number(os.date("%Y")).."_"..fullshape_number(os.date("%m")).."_"..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M"))..":"..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( fullshape_number(os.date("%Y")).."＿"..fullshape_number(os.date("%m")).."＿"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%d_%m_%Y %H:%M:%S"), "〔日月年 時:分:秒〕")
      yield_c( os.date("%m_%d_%Y %H:%M:%S"), "〔月日年 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "ftp") then
      yield_c( os.date("%Y.%m.%d %H:%M:%S"), "〔年月日 時:分:秒〕")
      -- yield_c( fullshape_number(os.date("%Y")).."."..fullshape_number(os.date("%m")).."."..fullshape_number(os.date("%d")).." "..fullshape_number(os.date("%H"))..":"..fullshape_number(os.date("%M"))..":"..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( fullshape_number(os.date("%Y")).."．"..fullshape_number(os.date("%m")).."．"..fullshape_number(os.date("%d")).."　"..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日 時:分:秒〕")
      yield_c( os.date("%d.%m.%Y %H:%M:%S"), "〔日月年 時:分:秒〕")
      yield_c( os.date("%m.%d.%Y %H:%M:%S"), "〔月日年 時:分:秒〕")
      return
    end

    if (input == env.prefix .. "ftz") then
      yield_c( rqzdx1().." "..ch_h_date(os.date("%H")).."點"..ch_minsec_date(os.date("%M")).."分"..ch_minsec_date(os.date("%S")).."秒", "〔中數〕")
      yield_c( rqzdx2().." "..chb_h_date(os.date("%H")).."點"..chb_minsec_date(os.date("%M")).."分"..chb_minsec_date(os.date("%S")).."秒", "〔中數〕")
      return
    end

    if (input == env.prefix .. "y") then
      yield_c( os.date("%Y"), "〔年〕 ~d")
      yield_c( os.date("%Y年"), "〔年〕 ~c")
      yield_c( rqzdx1(1), "〔中數〕 ~z")
      -- yield_c( rqzdx2(1), "〔年〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年", "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年", "〔民國中數〕 ~g")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( jp_y, "〔日本元号〕 ~j")
      -- local a, b, chinese_y = to_chinese_cal_local(os.time())
      local a, b, ly_1, ly_2, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ly_1, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "yj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( jp_y, "〔日本元号〕")
      yield_c( fullshape_number(jp_y), "〔日本元号〕")
      return
    end

    if (input == env.prefix .. "yh") then
      yield_c( "民國"..min_guo(os.date("%Y")).."年", "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年", "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年", "〔民國〕")
      return
    end

    if (input == env.prefix .. "yg") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年", "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "yl") then
      -- local a, b, chinese_y = to_chinese_cal_local(os.time())
      local a, b, ly_1, ly_2, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ly_1, "〔農曆〕")
      yield_c( ly_2, "〔農曆〕")
      -- local a, Y_g = lunarJzl(os.date("%Y%m%d%H"))
      -- yield_c( Y_g.."年", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "yc") then
      yield_c( os.date("%Y年"), "〔年〕")
      yield_c( os.date(" %Y 年"), "〔*年〕")
      yield_c( fullshape_number(os.date("%Y")).."年", "〔年〕")
      return
    end

    if (input == env.prefix .. "yd") then
      yield_c( os.date("%Y"), "〔年〕")
      yield_c( fullshape_number(os.date("%Y")), "〔年〕")
      return
    end

    if (input == env.prefix .. "yz") then
      yield_c( rqzdx1(1), "〔中數〕")
      yield_c( rqzdx2(1), "〔中數〕")
      return
    end

    if (input == env.prefix .. "m") then
      yield_c( os.date("%m"), "〔月〕 ~m")
      yield_c( string.gsub(os.date("%m月"), "^0", ""), "〔月〕 ~c")
      yield_c( rqzdx1(2), "〔中數〕 ~z")
      -- yield_c( rqzdx2(2), "〔月〕")
      yield_c( jp_m_date(os.date("%m")), "〔日本格式〕 ~j")
      yield_c( eng1_m_date(os.date("%m")), "〔月〕 ~a")
      yield_c( eng2_m_date(os.date("%m")), "〔月〕 ~e")
      -- local a, b, y, chinese_m = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "ml") then
      -- local a, b, y, chinese_m = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm, "〔農曆〕")
      local All_g, Y_g, M_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( M_g.."月", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "ma") then
      yield_c( eng1_m_date(os.date("%m")), "〔月〕")
      yield_c( " "..eng1_m_date(os.date("%m")).." ", "〔*月*〕")
      return
    end

    if (input == env.prefix .. "me") then
      yield_c( eng2_m_date(os.date("%m")), "〔月〕")
      yield_c( " "..eng2_m_date(os.date("%m")).." ", "〔*月*〕")
      yield_c( eng3_m_date(os.date("%m")), "〔月〕")
      yield_c( " "..eng3_m_date(os.date("%m")).." ", "〔*月*〕")
      return
    end

    if (input == env.prefix .. "mj") then
      yield_c( jp_m_date(os.date("%m")), "〔日本格式〕")
      return
    end

    if (input == env.prefix .. "mc") then
      yield_c( string.gsub(os.date("%m月"), "^0", ""), "〔月〕")
      yield_c( string.gsub(os.date(" %m 月"), "([ ])0", "%1"), "〔*月〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月"), "^0", "")), "〔月〕")
      yield_c( os.date("%m月"), "〔月〕")
      yield_c( os.date(" %m 月"), "〔*月〕")
      yield_c( fullshape_number(os.date("%m")).."月", "〔月〕")
      return
    end

    if (input == env.prefix .. "mm") then
      yield_c( os.date("%m"), "〔月〕")
      yield_c( fullshape_number(os.date("%m")), "〔月〕")
      return
    end

    if (input == env.prefix .. "mz") then
      yield_c( rqzdx1(2), "〔中數〕")
      yield_c( rqzdx2(2), "〔中數〕")
      return
    end

    if (input == env.prefix .. "d") then
      yield_c( os.date("%d"), "〔日〕 ~d")
      yield_c( string.gsub(os.date("%d日"), "^0", ""), "〔日〕 ~c")
      yield_c( rqzdx1(3), "〔中數〕 ~z")
      -- yield_c( rqzdx2(3), "〔日〕")
      yield_c( jp_d_date(os.date("%d")), "〔日本格式〕 ~j")
      yield_c( "the "..eng1_d_date(os.date("%d")), "〔日〕 ~a")
      yield_c( eng2_d_date(os.date("%d")), "〔日〕 ~e")
      -- local a, b, y, m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, e, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ld, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "dl") then
      -- local a, b, y, m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, e, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ld, "〔農曆〕")
      local All_g, Y_g, M_g, D_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( D_g.."日", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "da") then
      yield_c( "the "..eng1_d_date(os.date("%d")), "〔日〕")
      yield_c( " the "..eng1_d_date(os.date("%d")).." ", "〔*日*〕")
      yield_c( "The "..eng1_d_date(os.date("%d")), "〔日〕")
      yield_c( " The "..eng1_d_date(os.date("%d")).." ", "〔*日*〕")
      return
    end

    if (input == env.prefix .. "de") then
      yield_c( eng2_d_date(os.date("%d")), "〔日〕")
      yield_c( " "..eng2_d_date(os.date("%d")).." ", "〔*日*〕")
      yield_c( eng4_d_date(os.date("%d")), "〔日〕")
      yield_c( " "..eng4_d_date(os.date("%d")).." ", "〔*日*〕")
      -- yield_c( " "..eng3_d_date(os.date("%d")).." ", "〔*日*〕")
      return
    end

    if (input == env.prefix .. "dj") then
      yield_c( jp_d_date(os.date("%d")), "〔日本格式〕")
      return
    end

    if (input == env.prefix .. "dc") then
      yield_c( string.gsub(os.date("%d日"), "^0", ""), "〔日〕")
      yield_c( string.gsub(os.date(" %d 日"), "([ ])0", "%1"), "〔*日〕")
      yield_c( fullshape_number(string.gsub(os.date("%d日"), "^0", "")), "〔日〕")
      yield_c( os.date("%d日"), "〔日〕")
      yield_c( os.date(" %d 日"), "〔*日〕")
      yield_c( fullshape_number(os.date("%d")).."日", "〔日〕")
      return
    end

    if (input == env.prefix .. "dd") then
      yield_c( os.date("%d"), "〔日〕")
      yield_c( fullshape_number(os.date("%d")), "〔日〕")
      return
    end

    if (input == env.prefix .. "dz") then
      yield_c( rqzdx1(3), "〔中數〕")
      yield_c( rqzdx2(3), "〔中數〕")
      return
    end

    if (input == env.prefix .. "md") then
      yield_c( os.date("%m%d"), "〔月日〕 ~d")
      yield_c( os.date("%m.%d"), "〔月日〕 ~p")
      yield_c( os.date("%m/%d"), "〔月日〕 ~s")
      yield_c( os.date("%m-%d"), "〔月日〕 ~m")
      yield_c( os.date("%m_%d"), "〔月日〕 ~u")
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1"), "〔月日〕 ~c")
      yield_c( rqzdx1(23), "〔中數〕 ~z")
      yield_c( jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")), "〔日本格式〕 ~j")
      yield_c( eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d")), "〔月日〕 ~a")
      yield_c( eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔日月〕 ~e")
      -- local a, b, y, chinese_m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm..ld, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "mdl") then
      -- local a, b, y, chinese_m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm..ld, "〔農曆〕")
      local All_g, Y_g, M_g, D_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( M_g.."月"..D_g.."日", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "mda") then
      yield_c( eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d")), "〔月日〕")
      yield_c( eng1_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d")), "〔月日〕")
      yield_c( eng2_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d")), "〔月日〕")
      yield_c( eng3_m_date(os.date("%m")).." "..eng4_d_date(os.date("%d")), "〔月日〕")
      yield_c( eng1_m_date(os.date("%m")).." the "..eng1_d_date(os.date("%d")), "〔月日〕")
      return
    end

    if (input == env.prefix .. "mde") then
      yield_c( eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔日月〕")
      yield_c( eng3_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔日月〕")
      yield_c( eng2_d_date(os.date("%d")).." "..eng2_m_date(os.date("%m")), "〔日月〕")
      yield_c( "the "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m")), "〔日月〕")
      yield_c( "The "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m")), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mdj") then
      yield_c( jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")), "〔日本格式〕")
      return
    end

    if (input == env.prefix .. "mdc") then
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1"), "〔月日〕")
      yield_c( string.gsub(os.date(" %m 月 %d 日 "), "([ ])0", "%1"), "〔*月日*〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")), "〔月日〕")
      yield_c( os.date("%m月%d日"), "〔月日〕")
      yield_c( os.date(" %m 月 %d 日 "), "〔*月日*〕")
      yield_c( fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日", "〔月日〕")
      return
    end

    if (input == env.prefix .. "mdd") then
      yield_c( os.date("%m%d"), "〔月日〕")
      yield_c( fullshape_number(os.date("%m"))..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( os.date("%d%m"), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mds") then
      yield_c( os.date("%m/%d"), "〔月日〕")
      -- yield_c( fullshape_number(os.date("%m")).."/"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( fullshape_number(os.date("%m")).."／"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( os.date("%d/%m"), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mdm") then
      yield_c( os.date("%m-%d"), "〔月日〕")
      yield_c( fullshape_number(os.date("%m")).."－"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( os.date("%d-%m"), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mdu") then
      yield_c( os.date("%m_%d"), "〔月日〕")
      -- yield_c( fullshape_number(os.date("%m")).."_"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( fullshape_number(os.date("%m")).."＿"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( os.date("%d_%m"), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mdp") then
      yield_c( os.date("%m.%d"), "〔月日〕")
      -- yield_c( fullshape_number(os.date("%m")).."."..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( fullshape_number(os.date("%m")).."．"..fullshape_number(os.date("%d")), "〔月日〕")
      yield_c( os.date("%d.%m"), "〔日月〕")
      return
    end

    if (input == env.prefix .. "mdz") then
      yield_c( rqzdx1(23), "〔中數〕")
      yield_c( rqzdx2(23), "〔中數〕")
      return
    end

    if (input == env.prefix .. "mdw") then
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1").." ".."星期"..weekstyle()[1].." ", "〔月日週〕 ~c")
      -- yield_c( jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      yield_c( rqzdx1(23).." ".."星期"..weekstyle()[1].." ", "〔中數〕 ~z")
      -- yield_c( rqzdx2(23).." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      yield_c( jp_m_date(os.date("%m"))..jp_d_date(os.date("%d"))..weekstyle()[3], "〔日本格式〕 ~j")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d")), "〔週月日〕 ~a")
      yield_c( weekstyle()[6]..", "..eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔週日月〕 ~e")
      -- local a, b, y, chinese_m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm..ld.." "..weekstyle()[5].." ", "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "mdwl") then
      -- local a, b, y, chinese_m, chinese_d = to_chinese_cal_local(os.time())
      local a, b, c, d, lm, ld = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( lm..ld.." "..weekstyle()[5].." ", "〔農曆〕")
      local All_g, Y_g, M_g, D_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( M_g.."月"..D_g.."日".." "..weekstyle()[5].." ", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "mdwa") then
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d")), "〔週月日〕")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d")), "〔週月日〕")
      yield_c( weekstyle()[7]..", "..eng2_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d")), "〔週月日〕")
      yield_c( weekstyle()[8].." "..eng3_m_date(os.date("%m")).." "..eng4_d_date(os.date("%d")), "〔週月日〕")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." the "..eng1_d_date(os.date("%d")), "〔週月日〕")
      return
    end

    if (input == env.prefix .. "mdwe") then
      yield_c( weekstyle()[6]..", "..eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔週日月〕")
      yield_c( weekstyle()[6]..", "..eng3_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")), "〔週日月〕")
      yield_c( weekstyle()[7]..", "..eng2_d_date(os.date("%d")).." "..eng2_m_date(os.date("%m")), "〔週日月〕")
      yield_c( weekstyle()[6]..", ".."the "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m")), "〔週日月〕")
      -- yield_c( weekstyle()[6]..", ".."The "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔週日月〕")
      return
    end

    if (input == env.prefix .. "mdwc") then
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1").." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      yield_c( string.gsub(os.date(" %m 月 %d 日"), "([ ])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔*月日週*〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")).." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      yield_c( os.date("%m月%d日").." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      yield_c( os.date(" %m 月 %d 日").." ".."星期"..weekstyle()[1].." ", "〔*月日週*〕")
      yield_c( fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日".." ".."星期"..weekstyle()[1].." ", "〔月日週〕")
      return
    end

    if (input == env.prefix .. "mdwj") then
      yield_c( jp_m_date(os.date("%m"))..jp_d_date(os.date("%d"))..weekstyle()[3], "〔日本格式〕")
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1")..weekstyle()[3], "〔日本格式〕")
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1").." "..weekstyle()[5].."曜日 ", "〔日本格式〕")
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1").."("..weekstyle()[5].."曜日)", "〔日本格式〕")
      yield_c( string.gsub(os.date("%m月%d日"), "0([%d])", "%1").."（"..weekstyle()[5].."曜日）", "〔日本格式〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1"))..weekstyle()[3], "〔日本格式〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")).." "..weekstyle()[5].."曜日 ", "〔日本格式〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")).."("..weekstyle()[5].."曜日)", "〔日本格式〕")
      yield_c( fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")).."（"..weekstyle()[5].."曜日）", "〔日本格式〕")
      yield_c( os.date("%m月%d日")..weekstyle()[3], "〔日本格式〕")
      yield_c( os.date("%m月%d日").." "..weekstyle()[5].."曜日 ", "〔日本格式〕")
      yield_c( os.date("%m月%d日").."("..weekstyle()[5].."曜日)", "〔日本格式〕")
      yield_c( os.date("%m月%d日").."（"..weekstyle()[5].."曜日）", "〔日本格式〕")
      yield_c( fullshape_number(os.date("%m月%d日")..weekstyle()[3]), "〔日本格式〕")
      yield_c( fullshape_number(os.date("%m月%d日").." "..weekstyle()[5].."曜日 "), "〔日本格式〕")
      yield_c( fullshape_number(os.date("%m月%d日").."("..weekstyle()[5].."曜日)"), "〔日本格式〕")
      yield_c( fullshape_number(os.date("%m月%d日").."（"..weekstyle()[5].."曜日）"), "〔日本格式〕")
      return
    end

    if (input == env.prefix .. "mdwz") then
      yield_c( rqzdx1(23).." ".."星期"..weekstyle()[1].." ", "〔中數〕")
      yield_c( rqzdx2(23).." ".."星期"..weekstyle()[2].." ", "〔中數〕")
      return
    end

    if (input == env.prefix .. "ym") then
      yield_c( os.date("%Y%m"), "〔年月〕 ~d")
      yield_c( os.date("%Y.%m"), "〔年月〕 ~p")
      yield_c( os.date("%Y/%m"), "〔年月〕 ~s")
      yield_c( os.date("%Y-%m"), "〔年月〕 ~m")
      yield_c( os.date("%Y_%m"), "〔年月〕 ~u")
      yield_c( string.gsub(os.date("%Y年%m月"), "([^%d])0", "%1"), "〔年月〕 ~c")
      yield_c( rqzdx1(12), "〔中數〕 ~z")
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月", "([^%d])0", "%1"), "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(2), "〔民國中數〕 ~g")
      -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m")), "〔年月〕 ~j")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( jp_y..string.gsub(os.date("%m").."月", "([^%d])0", "%1"), "〔日本元号〕 ~j")
      yield_c( eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔月年〕 ~a")
      yield_c( eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔月年〕 ~e")
      -- local a, b, chinese_y, chinese_m = to_chinese_cal_local(os.time())
      local a, b, ly_1, ly_2, lm = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ly_1..lm, "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "ymj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( jp_y..string.gsub(os.date("%m").."月", "([^%d])0", "%1"), "〔日本元号〕")
      yield_c( fullshape_number(jp_y..string.gsub(os.date("%m").."月", "([^%d])0", "%1")), "〔日本元号〕")
      yield_c( jp_y..os.date("%m").."月", "〔日本元号〕")
      yield_c( fullshape_number(jp_y..os.date("%m").."月"), "〔日本元号〕")
      return
    end
    -- if (input == env.prefix .. "ymj") then
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m")), "〔年月〕")
    --   return
    -- end

    if (input == env.prefix .. "ymh") then
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月", "([^%d])0", "%1"), "〔民國〕")
      yield_c( string.gsub("民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月", "([^%d])0", "%1"), "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(string.gsub(os.date("%m"), "0([%d])", "%1")).."月", "〔民國〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月", "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月", "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(os.date("%m")).."月", "〔民國〕")
      return
    end

    if (input == env.prefix .. "ymg") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(2), "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年"..rqzdx1(2), "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年"..rqzdx2(2), "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "yml") then
      -- local a, b, chinese_y, chinese_m = to_chinese_cal_local(os.time())
      local a, b, ly_1, ly_2, lm = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ly_1..lm, "〔農曆〕")
      yield_c( ly_2..lm, "〔農曆〕")
      local All_g, Y_g, M_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( Y_g.."年"..M_g.."月", "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "yma") then
      yield_c( eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔月年〕")
      yield_c( eng2_m_date(os.date("%m"))..", "..os.date("%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "yme") then
      yield_c( eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔月年〕")
      yield_c( eng2_m_date(os.date("%m")).." "..os.date("%Y"), "〔月年〕")
      yield_c( eng3_m_date(os.date("%m")).." "..os.date("%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "ymc") then
      yield_c( string.gsub(os.date("%Y年%m月"), "([^%d])0", "%1"), "〔年月〕")
      yield_c( string.gsub(os.date(" %Y 年 %m 月 "), "([^%d])0", "%1"), "〔*年月*〕")
      yield_c( fullshape_number(string.gsub(os.date("%Y年%m月"), "([^%d])0", "%1")), "〔年月〕")
      yield_c( os.date("%Y年%m月"), "〔年月〕")
      yield_c( os.date(" %Y 年 %m 月 "), "〔*年月*〕")
      yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月", "〔年月〕")
      return
    end

    if (input == env.prefix .. "ymd") then
      yield_c( os.date("%Y%m"), "〔年月〕")
      yield_c( fullshape_number(os.date("%Y"))..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( os.date("%m%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "yms") then
      yield_c( os.date("%Y/%m"), "〔年月〕")
      -- yield_c( fullshape_number(os.date("%Y")).."/"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( fullshape_number(os.date("%Y")).."／"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( os.date("%m/%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "ymm") then
      yield_c( os.date("%Y-%m"), "〔年月〕")
      yield_c( fullshape_number(os.date("%Y")).."－"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( os.date("%m-%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "ymu") then
      yield_c( os.date("%Y_%m"), "〔年月〕")
      -- yield_c( fullshape_number(os.date("%Y")).."_"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( fullshape_number(os.date("%Y")).."＿"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( os.date("%m_%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "ymp") then
      yield_c( os.date("%Y.%m"), "〔年月〕")
      -- yield_c( fullshape_number(os.date("%Y")).."."..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( fullshape_number(os.date("%Y")).."．"..fullshape_number(os.date("%m")), "〔年月〕")
      yield_c( os.date("%m.%Y"), "〔月年〕")
      return
    end

    if (input == env.prefix .. "ymz") then
      yield_c( rqzdx1(12), "〔中數〕")
      yield_c( rqzdx2(12), "〔中數〕")
      return
    end

-- function week_translator0(input, seg)
    if (input == env.prefix .. "w") then
      yield_c( "星期"..weekstyle()[1], "〔週〕 ~c")
      yield_c( "週"..weekstyle()[1], "〔週〕 ~z")
      yield_c( weekstyle()[5].."曜日", "〔週〕 ~j")
      yield_c( weekstyle()[6], "〔週〕 ~a")
      yield_c( weekstyle()[7], "〔週〕 ~e")
      return
    end

    if (input == env.prefix .. "wa") then
      yield_c( weekstyle()[6], "〔週〕")
      yield_c( " "..weekstyle()[6].." ", "〔*週*〕")
      return
    end

    if (input == env.prefix .. "we") then
      yield_c( weekstyle()[7], "〔週〕")
      yield_c( " "..weekstyle()[7].." ", "〔*週*〕")
      yield_c( weekstyle()[8], "〔週〕")
      yield_c( " "..weekstyle()[8].." ", "〔*週*〕")
      return
    end

    if (input == env.prefix .. "wc") then
      yield_c( "星期"..weekstyle()[1], "〔週〕")
      yield_c( " ".."星期"..weekstyle()[1].." ", "〔*週*〕")
      yield_c( "(".."星期"..weekstyle()[1]..")", "〔週〕")
      yield_c( "（".."星期"..weekstyle()[1].."）", "〔週〕")
      yield_c( " ".."星期"..weekstyle()[2].." ", "〔*週*〕")
      return
    end

    if (input == env.prefix .. "wz") then
      yield_c( " ".."週"..weekstyle()[1].." ", "〔*週*〕")
      yield_c( "週"..weekstyle()[1], "〔週〕")
      yield_c( "(".."週"..weekstyle()[1]..")", "〔週〕")
      yield_c( "（".."週"..weekstyle()[1].."）", "〔週〕")
      yield_c( " ".."週"..weekstyle()[2].." ", "〔*週*〕")
      return
    end

    if (input == env.prefix .. "wj") then
      yield_c( " "..weekstyle()[5].."曜日 ", "〔*週*〕")
      yield_c( weekstyle()[5].."曜日", "〔週〕")
      yield_c( "("..weekstyle()[5].."曜日)", "〔週〕")
      yield_c( "（"..weekstyle()[5].."曜日）", "〔週〕")
      yield_c( weekstyle()[3], "〔週〕")
      yield_c( weekstyle()[4], "〔週〕")
      return
    end

-- function week_translator1(input, seg)
    if (input == env.prefix .. "fw") then
      yield_c( string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔年月日週〕 ~c")
      yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." ", "〔中數〕 ~z")
      -- yield_c( rqzdx2().." ".."星期"..weekstyle()[1].." ", "〔年月日週〕")
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日", "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔民國〕 ~h")
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." ".."星期"..weekstyle()[1].." ", "〔民國中數〕 ~g")
      -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..weekstyle()[3].." ", "〔年月日週〕 ~j")
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1")..weekstyle()[3], "〔日本元号〕 ~j")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d"))..", "..os.date("%Y"), "〔週月日年〕 ~a")
      yield_c( weekstyle()[6]..", "..eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔週日月年〕 ~e")
      -- local chinese_date = to_chinese_cal_local(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ll_1.." "..weekstyle()[5].." ", "〔農曆〕 ~l")
      return
    end

    if (input == env.prefix .. "fwj") then
      local jpymd, jp_y = jp_ymd(os.date("%Y"),os.date("%m"),os.date("%d"))
      yield_c( string.gsub(jpymd, "([^%d])0", "%1")..weekstyle()[3], "〔日本元号〕")
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").." "..weekstyle()[5].."曜日 ", "〔日本元号〕")
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").."("..weekstyle()[5].."曜日)", "〔日本元号〕")
      yield_c( string.gsub(jpymd, "([^%d])0", "%1").."（"..weekstyle()[5].."曜日）", "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1")..weekstyle()[3]), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1").." "..weekstyle()[5].."曜日 "), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1").."("..weekstyle()[5].."曜日)"), "〔日本元号〕")
      yield_c( fullshape_number(string.gsub(jpymd, "([^%d])0", "%1").."（"..weekstyle()[5].."曜日）"), "〔日本元号〕")
      yield_c( jpymd..weekstyle()[3], "〔日本元号〕")
      yield_c( jpymd.." "..weekstyle()[5].."曜日 ", "〔日本元号〕")
      yield_c( jpymd.."("..weekstyle()[5].."曜日)", "〔日本元号〕")
      yield_c( jpymd.."（"..weekstyle()[5].."曜日）", "〔日本元号〕")
      yield_c( fullshape_number(jpymd..weekstyle()[3]), "〔日本元号〕")
      yield_c( fullshape_number(jpymd.." "..weekstyle()[5].."曜日 "), "〔日本元号〕")
      yield_c( fullshape_number(jpymd.."("..weekstyle()[5].."曜日)"), "〔日本元号〕")
      yield_c( fullshape_number(jpymd.."（"..weekstyle()[5].."曜日）"), "〔日本元号〕")
      return
    end
    -- if (input == env.prefix .. "fwj") then
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..weekstyle()[3].." ", "〔年月日週〕")
    --   -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." ".."星期"..weekstyle()[1].." ", "〔年月日週〕")
    --   yield_c( os.date("%Y年%m月%d日").." "..weekstyle()[5].."曜日 ", "〔年月日週〕")
    --   yield_c( os.date("%Y年%m月%d日").."("..weekstyle()[5].."曜日)", "〔年月日週〕")
    --   yield_c( os.date("%Y年%m月%d日").."（"..weekstyle()[5].."曜日）", "〔年月日週〕")
    --   return
    -- end

    if (input == env.prefix .. "fwh") then
      yield_c( string.gsub("民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日", "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔民國〕")
      yield_c( string.gsub("民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日", "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(string.gsub(os.date("%m月%d日"), "0([%d])", "%1")).." ".."星期"..weekstyle()[1].." ", "〔民國〕")
      yield_c( "民國"..min_guo(os.date("%Y")).."年"..os.date("%m").."月"..os.date("%d").."日".." ".."星期"..weekstyle()[1].." ", "〔民國〕")
      yield_c( "民國 "..min_guo(os.date("%Y")).." 年 "..os.date("%m").." 月 "..os.date("%d").." 日".." ".."星期"..weekstyle()[1].." ", "〔民國*〕")
      yield_c( "民國"..fullshape_number(min_guo(os.date("%Y"))).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日".." ".."星期"..weekstyle()[1].." ", "〔民國〕")
      return
    end

    if (input == env.prefix .. "fwg") then
      yield_c( "民國"..purech_number(min_guo(os.date("%Y"))).."年"..rqzdx1(23).." ".."星期"..weekstyle()[1].." ", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[1], min_guo(os.date("%Y"))).."年"..rqzdx1(23).." ".."星期"..weekstyle()[1].." ", "〔民國中數〕")
      yield_c( "民國"..read_number(confs[2], min_guo(os.date("%Y"))).."年"..rqzdx2(23).." ".."星期"..weekstyle()[2].." ", "〔民國中數〕")
      return
    end

    if (input == env.prefix .. "fwl") then
      -- local chinese_date = to_chinese_cal_local(os.time())
      local ll_1, ll_2 = Date2LunarDate(os.date("%Y%m%d"))
      yield_c( ll_1.." "..weekstyle()[5].." ", "〔農曆〕")
      yield_c( ll_2.." "..weekstyle()[5].." ", "〔農曆〕")
      local All_g, Y_g, M_g, D_g = lunarJzl(os.date("%Y%m%d%H"))
      yield_c( Y_g.."年"..M_g.."月"..D_g.."日".." "..weekstyle()[5].." " , "〔農曆干支〕")
      return
    end

    if (input == env.prefix .. "fwa") then
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng2_d_date(os.date("%d"))..", "..os.date("%Y"), "〔週月日年〕")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d"))..", "..os.date("%Y"), "〔週月日年〕")
      yield_c( weekstyle()[7]..", "..eng2_m_date(os.date("%m")).." "..eng3_d_date(os.date("%d"))..", "..os.date("%Y"), "〔週月日年〕")
      yield_c( weekstyle()[8].." "..eng3_m_date(os.date("%m")).." "..eng4_d_date(os.date("%d")).." "..os.date("%Y"), "〔週月日年〕")
      yield_c( weekstyle()[6]..", "..eng1_m_date(os.date("%m")).." the "..eng1_d_date(os.date("%d"))..", "..os.date("%Y"), "〔週月日年〕")
      return
    end

    if (input == env.prefix .. "fwe") then
      yield_c( weekstyle()[6]..", "..eng2_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔週日月年〕")
      yield_c( weekstyle()[6]..", "..eng3_d_date(os.date("%d")).." "..eng1_m_date(os.date("%m")).." "..os.date("%Y"), "〔週日月年〕")
      yield_c( weekstyle()[7]..", "..eng2_d_date(os.date("%d")).." "..eng2_m_date(os.date("%m")).." "..os.date("%Y"), "〔週日月年〕")
      yield_c( weekstyle()[6]..", ".."the "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔週日月年〕")
      -- yield_c( weekstyle()[6]..", ".."The "..eng1_d_date(os.date("%d")).." of "..eng1_m_date(os.date("%m"))..", "..os.date("%Y"), "〔週日月年〕")
      return
    end

    if (input == env.prefix .. "fwc") then
      yield_c( string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔年月日週〕")
      yield_c( string.gsub(os.date(" %Y 年 %m 月 %d 日"), "([^%d])0", "%1").." ".."星期"..weekstyle()[1].." ", "〔*年月日週*〕")
      yield_c( fullshape_number(string.gsub(os.date("%Y年%m月%d日"), "([^%d])0", "%1")).." 星期"..weekstyle()[1].." ", "〔年月日週〕")
      yield_c( os.date("%Y年%m月%d日").." ".."星期"..weekstyle()[1].." ", "〔年月日週〕")
      yield_c( os.date(" %Y 年 %m 月 %d 日").." ".."星期"..weekstyle()[1].." ", "〔*年月日週*〕")
      yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日 ".."星期"..weekstyle()[1].." ", "〔年月日週〕")
      return
    end

    if (input == env.prefix .. "fwz") then
      yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." ", "〔中數〕")
      yield_c( rqzdx2().." ".."星期"..weekstyle()[2].." ", "〔中數〕")
      return
    end

-- function week_translator2(input, seg)
    -- if (input == env.prefix .. "fwt") then
    --   yield_c( os.date("%Y年%m月%d日").." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕")
    --   yield_c( os.date(" %Y 年 %m 月 %d 日").." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔*年月日週 時:分:秒〕")
    --   yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日 ".."星期"..weekstyle()[1].." "..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")).."："..fullshape_number(os.date("%S")), "〔年月日週 時:分:秒〕")
    --   yield_c( os.date("%Y年%m月%d日").." "..weekstyle()[5].."曜日 "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕")
    --   -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." ".."星期"..weekstyle()[1].." "..os.date("%H")..":"..os.date("%M")..":"..os.date("%S"), "〔年月日週 時:分:秒〕")
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..weekstyle()[3].." "..os.date("%H")..":"..os.date("%M")..":"..os.date("%S"), "〔年月日週 時:分:秒〕")
    --   yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕 ~z")
    --   -- yield_c( rqzdx2().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕")
    --   return
    -- end

    -- if (input == env.prefix .. "fwtz") then
    --   yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕")
    --   yield_c( rqzdx2().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M:%S"), "〔年月日週 時:分:秒〕")
    --   return
    -- end
-- function week_translator3(input, seg)
    -- if (input == env.prefix .. "fwn") then
    --   yield_c( os.date("%Y年%m月%d日").." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔年月日週 時:分〕")
    --   yield_c( os.date(" %Y 年 %m 月 %d 日").." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔*年月日週 時:分〕")
    --   yield_c( fullshape_number(os.date("%Y")).."年"..fullshape_number(os.date("%m")).."月"..fullshape_number(os.date("%d")).."日 ".."星期"..weekstyle()[1].." "..fullshape_number(os.date("%H")).."："..fullshape_number(os.date("%M")), "〔年月日週 時:分〕")
    --   yield_c( os.date("%Y年%m月%d日").." "..weekstyle()[5].."曜日 "..os.date("%H:%M"), "〔年月日週 時:分〕")
    --   -- yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." ".."星期"..weekstyle()[1].." "..os.date("%H")..":"..os.date("%M"), "〔年月日週 時:分〕")
    --   yield_c( os.date("%Y").."年 "..jp_m_date(os.date("%m"))..jp_d_date(os.date("%d")).." "..weekstyle()[3].." "..os.date("%H")..":"..os.date("%M"), "〔年月日週 時:分〕")
    --   yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔年月日週 時:分〕 ~z")
    --   -- yield_c( rqzdx2().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔年月日週 時:分〕")
    --   return
    -- end

    -- if (input == env.prefix .. "fwnz") then
    --   yield_c( rqzdx1().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔年月日週 時:分〕")
    --   yield_c( rqzdx2().." ".."星期"..weekstyle()[1].." "..os.date("%H:%M"), "〔年月日週 時:分〕")
    --   return
    -- end


-------------------------------------------------------------------------------------------------------------


    local englishout1 = string.match(input, env.prefix .. "/([%l.,/'-]+)$")
    if englishout1 then
      yield_c( english_s(englishout1), "〔一般字母小寫〕")
      yield_c( english_f_l(englishout1), "〔全形字母小寫〕")
      -- yield_c( english_1(englishout1), "〔數學字母大寫〕")
      yield_c( english_2(englishout1), "〔數學字母小寫〕")
      -- yield_c( english_3(englishout1), "〔帶圈字母大寫〕")
      yield_c( english_4(englishout1), "〔帶圈字母小寫〕")
      -- yield_c( english_5(englishout1), "〔括號字母大寫〕")
      yield_c( english_6(englishout1), "〔括號字母小寫〕")
      -- yield_c( english_7(englishout1), "〔方框字母〕")
      -- yield_c( english_8(englishout1), "〔黑圈字母〕")
      -- yield_c( english_9(englishout1), "〔黑框字母〕")
      if english_braille_c_l(englishout1) ~= english_braille_u_l(englishout1) then
        yield_c( english_braille_c_l(englishout1), "〔點字(computer)〕")
        yield_c( english_braille_u_l(englishout1), "〔點字(unified)〕")
      else
        yield_c( english_braille_c_l(englishout1), "〔點字(computer/unified)〕")
      end
      return
    end

    local englishout2 = string.match(input, env.prefix .. "\'([%l.,/'-]+)$")
    if englishout2 then
      -- yield_c( string.upper(string.sub(englishout2,1,1)) .. string.sub(englishout2,2,-1) , "〔一般字母開頭大寫〕")
      yield_c( english_s2u(englishout2), "〔一般字母開頭大寫〕")
      yield_c( english_f_ul(englishout2), "〔全形字母開頭大寫〕")
      yield_c( english_1_2(englishout2), "〔數學字母開頭大寫〕")
      yield_c( english_3_4(englishout2), "〔帶圈字母開頭大寫〕")
      yield_c( english_5_6(englishout2), "〔括號字母開頭大寫〕")
      if english_braille_c_ul(englishout2) ~= english_braille_u_ul(englishout2) then
        yield_c( english_braille_c_ul(englishout2), "〔點字(computer)〕")
        yield_c( english_braille_u_ul(englishout2), "〔點字(unified)〕")
      else
        yield_c( english_braille_c_ul(englishout2), "〔點字(computer/unified)〕")
      end
      return
    end

    local englishout3 = string.match(input, env.prefix .. ";([%l.,/'-]+)$")
    if englishout3 then
      local englishout3 = string.upper(englishout3)
      yield_c( english_s(englishout3), "〔一般字母大寫〕")
      yield_c( english_f_u(englishout3), "〔全形字母大寫〕")
      yield_c( english_1(englishout3), "〔數學字母大寫〕")
      yield_c( english_3(englishout3), "〔帶圈字母大寫〕")
      yield_c( english_5(englishout3), "〔括號字母大寫〕")
      yield_c( english_7(englishout3), "〔方框字母〕")
      yield_c( english_8(englishout3), "〔黑圈字母〕")
      yield_c( english_9(englishout3), "〔黑框字母〕")
      yield_c( english_s_u(englishout3), "〔小型字母大寫〕")
      if english_braille_c_u(englishout3) ~= english_braille_u_u(englishout3) then
        yield_c( english_braille_c_u(englishout3), "〔點字(computer)〕")
        yield_c( english_braille_u_u(englishout3), "〔點字(unified)〕")
      else
        yield_c( english_braille_c_u(englishout3), "〔點字(computer/unified)〕")
      end
      return
    end

    local utf_prefix = env.prefix
    local utf_input = string.match(input, utf_prefix .. "([xuco][0-9a-f]+)$")
    if utf_input then
      -- if (string.sub(input, 1, 2) ~= utf_prefix) then return end
      local dict = { c=10, x=16, u=16, o=8 } --{ u=16 } --{ d=10, u=16, e=8 }
      local snd = string.sub(utf_input, 1, 1)
      local n_bit = dict[snd]
      if n_bit == nil then return end
      local str = string.sub(utf_input, 2)
      local c = tonumber(str, n_bit)
      if c == nil then return end
      local utf_x = string.match(utf_input, "^x")
      local utf_u = string.match(utf_input, "^u")
      local utf_o = string.match(utf_input, "^o")
      local utf_c = string.match(utf_input, "^c")
      if utf_x then
        -- local fmt = "U"..snd.."%"..(n_bit==16 and "X" or snd)
        fmt = "  U+".."%X"
      elseif utf_u then
        fmt = "  U+".."%X"
      elseif utf_o then
        fmt = "  0o".."%o"
      else
        fmt = "  &#".."%d"..";"
      end
      -- 單獨查找(改用下面迴圈執行)
      -- local cand_ui_s = Candidate("utf", seg.start, seg._end, utf8_out(c), string.format(fmt, c) .. "  ( " .. url_encode(utf8_out(c)) .. " ）" )
      -- 排除數字太大超出範圍。正常範圍輸出已 string_char，故 0 直接可以限定。
      if (utf8_out(c) == 0) then
        cand_ui_s = Candidate("utf", seg.start, seg._end, "", "〈超出範圍〉" )  --字符過濾可能會過濾掉""整個選項。
        cand_ui_s.preedit = utf_prefix .. snd .. " " .. string.upper(string.sub(utf_input, 2))
        yield(cand_ui_s)
        return
      end
      -- 區間查找
      -- if (c*n_bit+n_bit-1 < 1048575) then  -- 補下一位，如：x8d70 為「走」，補 x8d70[0-f]。
      --   for i = c*n_bit, c*n_bit+n_bit-1 do
      if (c+16 <= 1048575) then  -- 補後面 16 碼，如：x8d70 為「走」，補 x8d7[0+16] 到 x8d80。
        for i = c, c+16 do
        -- for i = c+1, c+16 do
          local cand_ui_m = Candidate("utf", seg.start, seg._end, utf8_out(i), string.format(fmt, i) .. "  ( " .. url_encode(utf8_out(i)) .. " ）" )
          cand_ui_m.preedit = utf_prefix .. snd .. " " .. string.upper(string.sub(utf_input, 2))
          yield(cand_ui_m)
        end
        return
      -- elseif c <= 1048575 and c+16 > 1048575 then  -- Unicode 編碼末尾。
      elseif (c <= 1048575) then  -- Unicode 編碼末尾。
        for i = c, 1048575 do
          local cand_ui_m = Candidate("utf", seg.start, seg._end, utf8_out(i), string.format(fmt, i) .. "  ( " .. url_encode(utf8_out(i)) .. " ）" )
          cand_ui_m.preedit = utf_prefix .. snd .. " " .. string.upper(string.sub(utf_input, 2))
          yield(cand_ui_m)
        end
        return
      end
    end


    local url_e_prefix = env.prefix .. "e"
    local url_e_input = string.match(input, url_e_prefix .. "([0-9a-z][0-9a-f]*)$")
    if url_e_input then
      local preedit_url_e = string.gsub(url_e_input, "(%x%x)", "%%%1")
      local preedit_url_e = string.gsub(preedit_url_e, "(%x%x)(%x)$", "%1%%%2")
      local preedit_url_e = string.gsub(preedit_url_e, "^(%x)$", "%%%1")
      local url_e_cand = url_decode(url_e_input)

      local unfinished = string.match(url_e_cand, "… $")
      if unfinished then
        judge_unfinished = "〈輸入未完〉"
      else
        judge_unfinished = ""
      end

      local cand_url_e_error = Candidate("url_e", seg.start, seg._end, "", url_e_cand)  --字符過濾可能會過濾掉""整個選項。
      cand_url_e_error.preedit = url_e_prefix .. " " .. string.upper(preedit_url_e)

      local cand_url_e_sentence = Candidate("url_e", seg.start, seg._end, url_e_cand, judge_unfinished)
      cand_url_e_sentence.preedit = url_e_prefix .. " " .. string.upper(preedit_url_e)

      local url_first_word = utf8_sub(url_e_cand,1,1)
      local url_first_word_dec = utf8.codepoint(url_first_word)
      local cand_url_e_single = Candidate("url_e", seg.start, seg._end, url_first_word, string.format("  U+".."%X" ,url_first_word_dec) .. judge_unfinished)
      cand_url_e_single.preedit = url_e_prefix .. " " .. string.upper(preedit_url_e)

      local cand_url_e_code = Candidate("url_e", seg.start, seg._end, string.upper(preedit_url_e), "〔URL編碼〕")
      cand_url_e_code.preedit = url_e_prefix .. " " .. string.upper(preedit_url_e)

      local is_error = string.match(url_e_cand, "^〈輸入錯誤〉")
      if is_error then
      -- if (url_e_cand == "〈輸入錯誤〉") then
        yield(cand_url_e_error)
      elseif (url_e_cand == url_first_word) then
        yield(cand_url_e_single)
      -- elseif string.match(url_e_cand, "^ …") then
      --   yield(cand_url_e_sentence)
      else
        yield(cand_url_e_sentence)
        -- yield(cand_url_e_single)
      end
      yield(cand_url_e_code)
      return
    end

    -- local url_c_input = string.match(input, env.prefix .. "e([0-9a-z][0-9a-f]*)$")
    -- if url_c_input~=nil then
    --   local u_1 = string.match(url_c_input,"^([0-9a-f][0-9a-f][0-9a-f])$")
    --   local u_2 = string.match(url_c_input,"^([0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f])$")
    --   local u_3 = string.match(url_c_input,"^([0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f])$")
    --   local u_4 = string.match(url_c_input,"^([0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f])$")
    --   if u_1 ~= nil or u_2 ~= nil or u_3 ~= nil or u_4 ~= nil then
    --     url_c_input = url_c_input .. "0"
    --   end
    --   local url_10 = url_decode(url_c_input)
    --   local uc_i = string.upper(string.sub(input, 4, 5)) .. " " .. string.upper(string.sub(input, 6, 7)) .. " " .. string.upper(string.sub(input, 8, 9)) .. " " .. string.upper(string.sub(input, 10, 11)) .. " " .. string.upper(string.sub(input, 12, 13)) .. " " .. string.upper(string.sub(input, 14, 15))
    --   local uc_i = string.gsub(uc_i, " +$", "" )
    --   if string.match(url_10, "無此編碼") ~= nil then
    --     yield_c( url_10, "" )
    --   elseif string.match(url_c_input, "^[0-9a-z]$") ~= nil then
    --     local cand_uci_a = Candidate("url_e", seg.start, seg._end, url_10, url_10 )
    --     cand_uci_a.preedit = env.prefix .. "e " .. uc_i
    --     yield(cand_uci_a)
    --   else
    --     -- local u_c = string.upper(url_c_input)
    --     -- local u_c = string.gsub(u_c, '^', '%%')
    --     -- local u_c = string.gsub(u_c, '^(%%..)(..)', '%1%%%2')
    --     -- local u_c = string.gsub(u_c, '^(%%..%%..)(.+)', '%1%%%2')
    --     -- local u_c = string.gsub(u_c, '^(%%..%%..%%..)(.+)', '%1%%%2')
    --     -- local u_c = string.gsub(u_c, '^(%%..%%..%%..%%..)(.+)', '%1%%%2')
    --     -- local u_c = string.gsub(u_c, '^(%%..%%..%%..%%..%%..)(.+)', '%1%%%2')
    --     -- local u_c = string.gsub(u_c, '^(..)(.?.?)(.?.?)(.?.?)(.?.?)(.?.?)$', '%%%1%%%2%%%3%%%4%%%5%%%6')
    --     -- local u_c = string.gsub(u_c, '[%%]+$', '')
    --     -- yield_c( utf8_out(url_10), u_c )
    --     local cand_uci_s = Candidate("url_e", seg.start, seg._end, utf8_out(url_10), url_encode(utf8_out(url_10)) )
    --     cand_uci_s.preedit = env.prefix .. "e " .. uc_i
    --     yield(cand_uci_s)
    --   end
    --   -- if url_10*10+10-1 < 1048575 then
    --   --   for i = url_10*10, url_10*10+10-1 do
    --   if tonumber(url_10)+16 < 1048575 then
    --     for i = tonumber(url_10)+1, tonumber(url_10)+16 do
    --       local cand_uci_m = Candidate("url_e", seg.start, seg._end, utf8_out(i), url_encode(utf8_out(i)) )
    --       cand_uci_m.preedit = env.prefix .. "e " .. uc_i
    --       yield(cand_uci_m)
    --     end
    --   end
    --   return
    -- end


    local y, m, d = string.match(input, env.prefix .. "(%d+)y(%d?%d)m(%d?%d)d?$")
    -- if not y then y, m, d = string.match(input, env.prefix .. "y(%d+)m(%d?%d)d(%d?%d)$") end
    if y and tonumber(m)<13 and tonumber(d)<32 then
      yield_c( y.."年"..m.."月"..d.."日", "〔日期〕")
      yield_c( " "..y.." 年 "..m.." 月 "..d.." 日 ", "〔*日期*〕")
      yield_c( fullshape_number(y).."年"..fullshape_number(m).."月"..fullshape_number(d).."日", "〔全形日期〕")
      yield_c( ch_y_date(y).."年"..ch_m_date(m).."月"..ch_d_date(d).."日", "〔小寫中文日期〕")
      yield_c( chb_y_date(y).."年"..chb_m_date(m).."月"..chb_d_date(d).."日", "〔大寫中文日期〕")
      if (tonumber(y) > 1911) then
        yield_c( "民國"..min_guo(y).."年"..m.."月"..d.."日", "〔民國〕")
        yield_c( "民國"..purech_number(min_guo(y)).."年"..ch_m_date(m).."月"..ch_d_date(d).."日", "〔民國〕")
        yield_c( "民國"..read_number(confs[1], min_guo(y)).."年"..ch_m_date(m).."月"..ch_d_date(d).."日", "〔民國〕")
      elseif (tonumber(y) <= 1911) then
        yield_c( "民國前"..min_guo(y).."年"..m.."月"..d.."日", "〔民國〕")
        yield_c( "民國前"..purech_number(min_guo(y)).."年"..ch_m_date(m).."月"..ch_d_date(d).."日", "〔民國〕")
        yield_c( "民國前"..read_number(confs[1], min_guo(y)).."年"..ch_m_date(m).."月"..ch_d_date(d).."日", "〔民國〕")
      end
      -- yield_c( y.."年 "..jp_m_date(m)..jp_d_date(d), "〔日文日期〕")
      local jpymd2, jp_y2 = jp_ymd(y,m,d)
      yield_c( jp_y2..m.."月"..d.."日" , "〔日本元号〕")
      yield_c( eng1_m_date(m).." "..eng2_d_date(d)..", "..y, "〔美式月日年〕")
      yield_c( eng1_m_date(m).." "..eng3_d_date(d)..", "..y, "〔美式月日年〕")
      yield_c( eng2_m_date(m).." "..eng3_d_date(d)..", "..y, "〔美式月日年〕")
      yield_c( eng3_m_date(m).." "..eng4_d_date(d).." "..y, "〔美式月日年〕")
      yield_c( eng1_m_date(m).." the "..eng1_d_date(d)..", "..y, "〔美式月日年〕")
      yield_c( eng2_d_date(d).." "..eng1_m_date(m).." "..y, "〔英式日月年〕")
      yield_c( eng3_d_date(d).." "..eng1_m_date(m).." "..y, "〔英式日月年〕")
      yield_c( eng2_d_date(d).." "..eng2_m_date(m).." "..y, "〔英式日月年〕")
      yield_c( "the "..eng1_d_date(d).." of "..eng1_m_date(m)..", "..y, "〔英式日月年〕")
      yield_c( "The "..eng1_d_date(d).." of "..eng1_m_date(m)..", "..y, "〔英式日月年〕")
      if tonumber(y) > 1899 and tonumber(y) < 2101 then
        -- local chinese_date_input = to_chinese_cal_local(os.time({year = y, month = m, day = d, hour = 12}))
        local ll_1b, ll_2b = Date2LunarDate(y .. string.format("%02d", m) .. string.format("%02d", d))
        -- if (Date2LunarDate~=nil) then
        if ll_1b~=nil and ll_2b~=nil then
          yield_c( ll_1b, "〔西曆→農曆〕")
          yield_c( ll_2b, "〔西曆→農曆〕")
        end
      end
      if tonumber(y) > 1901 and tonumber(y) < 2101 then
        local All_g2, Y_g2, M_g2, D_g2 = lunarJzl(y .. string.format("%02d", m) .. string.format("%02d", d) .. 12)
        if (All_g2~=nil) then
          yield_c( Y_g2.."年"..M_g2.."月"..D_g2.."日", "〔西曆→農曆干支〕")
        end
        local LDD2D = LunarDate2Date(y .. string.format("%02d", m) .. string.format("%02d", d), 0 )
        local LDD2D_leap_year  = LunarDate2Date(y .. string.format("%02d", m) .. string.format("%02d", d), 1 )
        -- if (Date2LunarDate~=nil) then
        if (LDD2D~=nil) then
          yield_c( LDD2D, "〔農曆→西曆〕")
          yield_c( LDD2D_leap_year, "〔農曆(閏)→西曆〕")
        end
        -- local chinese_date_input2 = to_chinese_cal(y, m, d)
        -- if (chinese_date_input2~=nil) then
        --   yield_c( chinese_date_input2 .. " ", "〔農曆，可能有誤！〕")
        -- end
      end
      return
    end

    local m, d = string.match(input, env.prefix .. "(%d?%d)m(%d?%d)d?$")
    -- if not m then m, d =  string.match(input, env.prefix .. "m(%d?%d)d(%d?%d)$") end
    if m and tonumber(m)<13 and tonumber(d)<32 then
      yield_c( m.."月"..d.."日" , "〔日期〕")
      yield_c( " "..m.." 月 "..d.." 日 " , "〔*日期*〕")
      yield_c( fullshape_number(m).."月"..fullshape_number(d).."日" , "〔全形日期〕")
      yield_c( ch_m_date(m).."月"..ch_d_date(d).."日" , "〔小寫中文日期〕")
      yield_c( chb_m_date(m).."月"..chb_d_date(d).."日" , "〔大寫中文日期〕")
      yield_c( jp_m_date(m)..jp_d_date(d), "〔日文日期〕")
      yield_c( eng1_m_date(m).." "..eng2_d_date(d), "〔美式月日〕")
      yield_c( eng1_m_date(m).." "..eng3_d_date(d), "〔美式月日〕")
      yield_c( eng2_m_date(m).." "..eng3_d_date(d), "〔美式月日〕")
      yield_c( eng3_m_date(m).." "..eng4_d_date(d), "〔美式月日〕")
      yield_c( eng1_m_date(m).." the "..eng1_d_date(d), "〔美式月日〕")
      yield_c( eng2_d_date(d).." "..eng1_m_date(m), "〔英式日月〕")
      yield_c( eng3_d_date(d).." "..eng1_m_date(m), "〔英式日月〕")
      yield_c( eng2_d_date(d).." "..eng2_m_date(m), "〔英式日月〕")
      yield_c( "the "..eng1_d_date(d).." of "..eng1_m_date(m), "〔英式日月〕")
      yield_c( "The "..eng1_d_date(d).." of "..eng1_m_date(m), "〔英式日月〕")
      return
    end

    local y, m = string.match(input, env.prefix .. "(%d+)y(%d?%d)m?$")
    -- if not y then y, m = string.match(input, env.prefix .. "y(%d+)m(%d?%d)$") end
    if y and tonumber(m)<13 then
      yield_c( y.."年"..m.."月" , "〔日期〕")
      yield_c( " "..y.." 年 "..m.." 月 " , "〔*日期*〕")
      yield_c( fullshape_number(y).."年"..fullshape_number(m).."月" , "〔全形日期〕")
      yield_c( ch_y_date(y).."年"..ch_m_date(m).."月" , "〔小寫中文日期〕")
      yield_c( chb_y_date(y).."年"..chb_m_date(m).."月" , "〔大寫中文日期〕")
      if (tonumber(y) > 1911) then
        yield_c( "民國"..min_guo(y).."年"..m.."月" , "〔民國〕")
        yield_c( "民國"..purech_number(min_guo(y)).."年"..ch_m_date(m).."月" , "〔民國〕")
        yield_c( "民國"..read_number(confs[1], min_guo(y)).."年"..ch_m_date(m).."月" , "〔民國〕")
      elseif (tonumber(y) <= 1911) then
        yield_c( "民國前"..min_guo(y).."年"..m.."月" , "〔民國〕")
        yield_c( "民國前"..purech_number(min_guo(y)).."年"..ch_m_date(m).."月" , "〔民國〕")
        yield_c( "民國前"..read_number(confs[1], min_guo(y)).."年"..ch_m_date(m).."月" , "〔民國〕")
      end
      -- yield_c( y.."年 "..jp_m_date(m), "〔日文日期〕")
      -- local jpymd2, jp_y2 = jp_ymd(y,m,"1")
      -- yield_c( jp_y2..m.."月" , "〔日本元号〕(沒有日，元号可能有誤)")
      yield_c( eng1_m_date(m)..", "..y, "〔美式/英式月年〕")
      yield_c( eng2_m_date(m)..", "..y, "〔美式月年〕")
      yield_c( eng3_m_date(m).." "..y, "〔美式月年〕")
      yield_c( eng1_m_date(m).." "..y, "〔英式月年〕")
      yield_c( eng2_m_date(m).." "..y, "〔英式月年〕")
      return
    end

    local y = string.match(input, env.prefix .. "(%d+)y$")
    -- if not y then y = string.match(input, env.prefix .. "y(%d+)$") end
    if y then
      yield_c( y.."年" , "〔日期〕")
      yield_c( " "..y.." 年 " , "〔*日期*〕")
      yield_c( fullshape_number(y).."年" , "〔全形日期〕")
      yield_c( ch_y_date(y).."年" , "〔小寫中文日期〕")
      yield_c( chb_y_date(y).."年" , "〔大寫中文日期〕")
      if (tonumber(y) > 1911) then
        yield_c( "民國"..min_guo(y).."年", "〔民國〕")
        yield_c( "民國"..purech_number(min_guo(y)).."年", "〔民國〕")
        yield_c( "民國"..read_number(confs[1], min_guo(y)).."年", "〔民國〕")
      elseif (tonumber(y) <= 1911) then
        yield_c( "民國前"..min_guo(y).."年", "〔民國〕")
        yield_c( "民國前"..purech_number(min_guo(y)).."年", "〔民國〕")
        yield_c( "民國前"..read_number(confs[1], min_guo(y)).."年", "〔民國〕")
      end
      -- yield_c( y.."年 ", "〔日文日期〕")
      -- local jpymd2, jp_y2 = jp_ymd(y,"1","1")
      -- yield_c( jp_y2 , "〔日本元号〕(沒有月日，元号可能有誤)")
      yield_c( y, "〔美式/英式月年〕")

      return
    end

    local m = string.match(input, env.prefix .. "(%d?%d)m$")
    -- if not m then m =  string.match(input, env.prefix .. "m(%d?%d)$") end
    if m and tonumber(m)<13 then
      yield_c( m.."月" , "〔日期〕")
      yield_c( " "..m.." 月 " , "〔*日期*〕")
      yield_c( fullshape_number(m).."月" , "〔全形日期〕")
      yield_c( ch_m_date(m).."月" , "〔小寫中文日期〕")
      yield_c( chb_m_date(m).."月" , "〔大寫中文日期〕")
      yield_c( jp_m_date(m), "〔日文日期〕")
      yield_c( eng1_m_date(m), "〔美式/英式月日〕")
      yield_c( eng2_m_date(m), "〔美式/英式月日〕")
      yield_c( eng3_m_date(m), "〔美式月日〕")
      return
    end

    local d = string.match(input, env.prefix .. "(%d?%d)d$")
    -- if not d then d =  string.match(input, env.prefix .. "d(%d?%d)$") end
    if d and tonumber(d)<32 then
      yield_c( d.."日" , "〔日期〕")
      yield_c( " "..d.." 日 " , "〔*日期*〕")
      yield_c( fullshape_number(d).."日" , "〔全形日期〕")
      yield_c( ch_d_date(d).."日" , "〔小寫中文日期〕")
      yield_c( chb_d_date(d).."日" , "〔大寫中文日期〕")
      yield_c( jp_d_date(d), "〔日文日期〕")
      yield_c( eng2_d_date(d), "〔美式/英式月日〕")
      yield_c( eng3_d_date(d), "〔美式/英式月日〕")
      yield_c( eng4_d_date(d), "〔美式月日〕")
      yield_c( "the "..eng1_d_date(d), "〔美式/英式月日〕")
      yield_c( "The "..eng1_d_date(d), "〔英式日月〕")
      return
    end


    --- 補以下開頭負號缺漏
    local neg_nf = string.match(input, env.prefix .. "[-r]$")
    if neg_nf then
      yield_c( "-", "〔一般負號〕")
      yield_c( "－", "〔全形負號〕")
      yield_c( "負", "〔中文負號〕")
      yield_c( "槓", "〔軍中負號〕")
      yield_c( "⁻", "〔上標負號〕")
      yield_c( "₋", "〔下標負號〕")
      yield_c( "㊀", "〔帶圈負號〕")
      yield_c( "⠤", "〔點字(computer/unified)〕")
      return
    end

    --- 補以下開頭小數點缺漏
    local dot = string.match(input, env.prefix .. "%.$")
    if dot then
      yield_c( ".", "〔一般小數點〕")
      -- yield_c( "．", "〔全形小數點〕")
      yield_c( "點", "〔中文小數點〕")
      -- yield_c( "點", "〔軍中小數點〕")
      yield_c( "⠨", "〔點字(computer)〕")
      yield_c( "⠲", "〔點字(unified)〕")
      return
    end

    --- 補以下開頭負號+小數點缺漏
    local neg_nf_dot = string.match(input, env.prefix .. "[-r][.]$")
    if neg_nf_dot then
      yield_c( "-0.", "〔一般數字〕")
      yield_c( ",", "〔千分位〕")
      yield_c( "-0.000000E+00", "〔科學計數〕")
      yield_c( "-0.000000e+00", "〔科學計數〕")
      yield_c( "- 𝟎.", "〔數學粗體數字〕")
      yield_c( "- 𝟘.", "〔數學空心數字〕")
      yield_c( "－０.", "〔全形數字〕")
      yield_c( "負點", "〔純中文數字〕")
      yield_c( "槓點", "〔軍中數字〕")
      yield_c( "⠤⠨", "〔點字(computer)〕")
      yield_c( "⠤⠲", "〔點字(unified)〕")
      return
    end

    -- local numberout = string.match(input, env.prefix .. "/?(%d+)$")
    local neg_n, dot0 ,numberout, dot1, afterdot = string.match(input, env.prefix .. "([-rq(]?)([.]?)(%d+)(%.?)(%d*)$")
    if (tonumber(numberout)~=nil) then
      local neg_n = string.gsub(neg_n, "r", "-")  --配合計算機算符
      local neg_n = string.gsub(neg_n, "[q(]", "")  --配合計算機算符

      if dot0~="" and dot1~="" then
        yield_c( "" , "〔不能兩個小數點〕")  --字符過濾可能會過濾掉""整個選項。
        return
      elseif (dot0~="") then
        afterdot = numberout
        dot1 = dot0
        numberout = "0"
      end

      local neg_n_f = string.gsub(neg_n, "-", "－")
      local neg_n_ch = string.gsub(neg_n, "-", "負")
      local neg_n_m = string.gsub(neg_n, "-", "槓")
      local neg_n_l1 = string.gsub(neg_n, "-", "⁻")
      local neg_n_l2 = string.gsub(neg_n, "-", "₋")
      local neg_n_c = string.gsub(neg_n, "-", "㊀")
      local neg_n_b = string.gsub(neg_n, "-", "⠤")

    -- if numberout~=nil and tonumber(nn)~=nil then
      local nn = string.sub(numberout, 1)
      --[[ 用 yield 產生一個候選項
      候選項的構造函數是 Candidate，它有五個參數：
      - type: 字符串，表示候選項的類型（可隨意取）
      - start: 候選項對應的輸入串的起始位置
      - _end:  候選項對應的輸入串的結束位置
      - text:  候選項的文本
      - comment: 候選項的注釋
      --]]
      yield_c( neg_n .. numberout .. dot1 .. afterdot , "〔一般數字〕")

      if string.len(numberout) < 4 or neg_n~="" then
        yield_c( "," , "〔千分位〕")
      else
        -- local k = string.sub(numberout, 1, -1) -- 取參數
        local result = formatnumberthousands(numberout) --- 調用算法
        yield_c( result .. dot1 .. afterdot , "〔千分位〕")
      end

      yield_c( string.format("%E", neg_n .. numberout .. dot1 .. afterdot ), "〔科學計數〕")
      yield_c( string.format("%e", neg_n .. numberout .. dot1 .. afterdot ), "〔科學計數〕")
      if neg_n == "" then
        yield_c( math1_number(numberout) .. dot1 .. math1_number(afterdot), "〔數學粗體數字〕")
        yield_c( math2_number(numberout) .. dot1 .. math2_number(afterdot), "〔數學空心數字〕")
      elseif neg_n ~="" then
        yield_c( neg_n .. " " .. math1_number(numberout) .. dot1 .. math1_number(afterdot), "〔數學粗體數字〕")
        yield_c( neg_n .. " " .. math2_number(numberout) .. dot1 .. math2_number(afterdot), "〔數學空心數字〕")
      end
      yield_c( neg_n_f .. fullshape_number(numberout) .. dot1 .. fullshape_number(afterdot), "〔全形數字〕")

      if (dot1=="") then
        yield_c( neg_n_l1 .. little1_number(numberout), "〔上標數字〕")
        yield_c( neg_n_l2 .. little2_number(numberout), "〔下標數字〕")

        --- 超過「1000垓」則不顯示中文數字
        if (string.len(numberout) < 25) then
          -- for _, conf in ipairs(confs) do
          --   local r = read_number(conf, nn)
          --   yield_c( r, conf.comment)
          -- end
          yield_c( neg_n_ch .. read_number(confs[1], nn), confs[1].comment)
          yield_c( neg_n_ch .. read_number_bank(confs[2], nn), confs[2].comment)
        -- else
        --   yield_c( "超過位數", confs[1].comment)
        --   yield_c( "超過位數", confs[2].comment)
        end

        if (string.len(numberout) < 2) then
          yield_c( "元整", "〔純中文數字〕")
        else
          yield_c( neg_n_ch .. purech_number(numberout), "〔純中文數字〕")
        end

        yield_c( neg_n_m .. military_number(numberout), "〔軍中數字〕")

        yield_c( neg_n_c .. circled1_number(numberout), "〔帶圈數字〕")
        yield_c( neg_n_c .. circled2_number(numberout), "〔帶圈無襯線數字〕")
        yield_c( neg_n_f .. circled3_number(numberout), "〔反白帶圈數字〕")
        yield_c( neg_n_f .. circled4_number(numberout), "〔反白帶圈無襯線數字〕")
        yield_c( neg_n_f .. circled5_number(numberout), "〔帶圈中文數字〕")

        yield_c( neg_n_f .. keycap_number(numberout), "〔鍵帽數字〕")
        yield_c( neg_n_b .. braille_c_number(numberout), "〔點字(computer)〕")
        -- yield_c( neg_n_b .. "⠼" .. braille_c_number(numberout), "〔點字(一般)〕")
        yield_c( neg_n_b .. "⠼" .. braille_u_number(numberout), "〔點字(unified)〕")

        if (neg_n=="") then
          if tonumber(numberout)==1 or tonumber(numberout)==0 then
            yield_c( string.sub(numberout, -1), "〔二進位〕")
          --- 浮點精度關係，二進制轉換運算中：
          --- math.floor 極限是小數點後15位(小於16位，1.9999999999999999)
          --- math.fmod 極限是小數點後13位(小於14位，1.99999999999999，14位開頭為偶數時除2是正確的，奇數則不正確)
          elseif (string.len(numberout) < 14) then
          --- （以下還是有錯誤！）等於大於9999999999999999（16位-1），lua中幾個轉換函數都會出錯，運算會不正確
          -- elseif (tonumber(numberout) < 9999999999999999) then
          -- elseif (string.len(numberout) < 16) then
            yield_c( Dec2bin(numberout), "〔二進位〕")
          -- else
          --   yield_c( "", "〔二進位〕(數值超過 14位 可能會不正確)")
          --   -- yield_c( "", "〔二進位〕(數值超過 16位-1 會不正確)")
          end

          --- 整數庫限制：最大的64位元整數超過64位等同十進制2^63，超過則報錯，極限2^63-1，超過設定不顯示
          if (tonumber(numberout) < 9223372036854775808) then
          -- if (string.len(numberout) < 19) then
            yield_c( string.format("%X",numberout), "〔十六進位〕")
            yield_c( string.format("%x",numberout), "〔十六進位〕")
            yield_c( string.format("%o",numberout), "〔八進位〕")
          end
        end

      elseif (dot0~="") then
        yield_c( neg_n_ch .. purech_number(dot1..afterdot), "〔純中文數字〕")
        yield_c( neg_n_m .. military_number(dot1..afterdot), "〔軍中數字〕")
        yield_c( neg_n_b .. braille_c_number(dot1..afterdot), "〔點字(computer)〕")
        -- yield_c( neg_n_b .. "⠼" .. braille_c_number(dot1..afterdot), "〔點字(一般)〕")
        yield_c( neg_n_b .. "⠼" .. braille_u_number(dot1..afterdot), "〔點字(unified)〕")
        return
      elseif dot0=="" and dot1~="" then
        yield_c( neg_n_ch .. purech_number(numberout..dot1..afterdot), "〔純中文數字〕")
        yield_c( neg_n_m .. military_number(numberout..dot1..afterdot), "〔軍中數字〕")
        yield_c( neg_n_b .. braille_c_number(numberout..dot1..afterdot), "〔點字(computer)〕")
        -- yield_c( neg_n_b .. "⠼" .. braille_c_number(numberout..dot1..afterdot), "〔點字(一般)〕")
        yield_c( neg_n_b .. "⠼" .. braille_u_number(numberout..dot1..afterdot), "〔點字(unified)〕")
        return
      end

      return
    end


    --- 計算機
    local c_input = string.match(input, env.prefix .. "([-.rq(]?[%d.]+[-+*/^asrvxqw()][-+*/^asrvxqw().%d]*)$")
    if c_input then
      local c_input = string.gsub(c_input, "a", "+")
      local c_input = string.gsub(c_input, "s", "^")
      local c_input = string.gsub(c_input, "r", "-")
      local c_input = string.gsub(c_input, "v", "/")
      local c_input = string.gsub(c_input, "x", "*")
      local c_input = string.gsub(c_input, "q", "(")
      local c_input = string.gsub(c_input, "w", ")")
      local input_exp = string.gsub(c_input, "^0+(%d)", "%1")
      local input_exp = string.gsub(input_exp, "([-+*/^()])0+(%d)", "%1%2")
      local input_exp = string.gsub(input_exp, "([.]%d*)0+([-+*/^()])", "%1%2")
      local input_exp = string.gsub(input_exp, "([.]%d*)0+$", "%1")
      local input_exp = string.gsub(input_exp, "^[.]", "0.")
      local input_exp = string.gsub(input_exp, "[.]$", "")
      local input_exp = string.gsub(input_exp, "[.]([-+*/^()])", "%1")
      local input_exp = string.gsub(input_exp, "([-+*/^()])[.]", "%10.")
      local c_output = simple_calculator(input_exp)
      local c_preedit = string.gsub(c_input, "([-+*/^()])", " %1 ")

      local cc_out = Candidate("s_cal", seg.start, seg._end, c_output, "〔結果〕")
      local cc_error = Candidate("s_cal", seg.start, seg._end, "", c_output.."〔結果〕")
      local cc_exp = Candidate("s_cal", seg.start, seg._end, input_exp .. "=" .. c_output, "〔規格化算式〕")
      cc_out.preedit = env.prefix .. " " .. c_preedit .. " \t（簡易計算機）"
      cc_error.preedit = env.prefix .. " " .. c_preedit .. " \t（簡易計算機）"
      cc_exp.preedit = env.prefix .. " " .. c_preedit .. " \t（簡易計算機）"
      yield( c_output:sub(1,1)=="E" and cc_error or cc_out )
      yield(cc_exp)
      return
    end


    -- -- 測試空白不上屏在 translator 中直接處理！
    -- -- local engine = env.engine
    -- -- local context = engine.context
    -- -- local kkk = string.match(o_input, env.prefix .. "")
    -- -- local engine = env.engine
    -- -- local context = engine.context
    -- -- local o_input = context.input
    -- local kkk = string.match(input, "( )$")
    -- -- local page_size = engine.schema.page_size
    -- if (kkk~=nil) then --and context:is_composing()
    --   -- local s_orig = context:get_commit_text()
    --   -- local o_input = context.input
    --   -- engine:commit_text(s_orig .. "a")
    --   -- context:clear()
    --   -- yield_c( "nnnnnm", "〔千分位數字〕")
    --   return 1 -- kAccepted
    -- end

  end
end


return {init = init, func = translate}