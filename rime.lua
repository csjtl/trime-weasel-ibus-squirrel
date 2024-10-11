-- Usage:
--  engine:
--    ...
--    translators:
--      ...
--      - lua_translator@lua_function3
--      - lua_translator@lua_function4
--      ...
--    filters:
--      ...
--      - lua_filter@lua_function1
--      - lua_filter@lua_function2
--    可挂接作用功能:
--      ...
--      - lua_translator@t_translator                --（关）「`」开头打出时间日期
--      - lua_translator@t2_translator               --（关）「'/」开头打出时间日期
--      - lua_translator@mf_translator               --（引lua资料夹）合并以上两个时间日期translator。
--      - lua_translator@date_translator             --（引lua资料夹）（liur）「``」开头打出时间日期
--      - lua_translator@mytranslator                --（关）（有缺函数，参考勿用，暂关闭）
--      - lua_translator@instruction_dbpmf           --（引lua资料夹）选项中显示洋葱双拼各种说明
--      - lua_translator@instruction_grave_bpmf      --（引lua资料夹）选项中显示洋葱注音各种说明
--      - lua_translator@instruction_ocm             --（引lua资料夹）选项中显示洋葱虾米各种说明
--      - lua_translator@email_url_translator        --（引lua资料夹）输入email、网址（可多加www.）
--      - lua_translator@convert_japan_translator    --（关）（效能不佳）日文出罗马字、全形罗马字、半形片假名、全片假名、全平假名。
--      - lua_translator@p_convert_japan_translator  --（关）（效能不佳）同 convert_japan_translator，挂接方案用。
--      - lua_translator@lua_custom_phrase           --（引lua资料夹）取代原先 table_translator@custom_phrase。可多行，用\n\r。
--
--
--      《 ＊ 以下「滤镜」注意在 filters 中的顺序，关系到作用效果 》
--      - lua_filter@charset_cjk_filter              --（引lua资料夹）遮屏含 CJK 扩展汉字的候选项
--      - lua_filter@charset_cjk_filter_plus         --（引lua资料夹）（bopomo_onion_double） 遮屏含 CJK 扩展汉字的候选项，开关（only_cjk_filter）
--      - lua_filter@charset_comment_filter          --（引lua资料夹）候选项注释其所属字符集，如：CJK、ExtA
--      - lua_filter@single_char_filter              --（引lua资料夹）候选项重排序，使单字优先
--      - lua_filter@reverse_lookup_filter           --（关）依地球拼音为候选项加上带调拼音的注释
--      - lua_filter@myfilter                        --（关）把 charset_comment_filter 和 reverse_lookup_filter 注释串在一起，如：CJK(hǎo)
--
--      - lua_filter@charset_filter2                 --（引lua资料夹）（ocm_onionmix）（手机全方案会用到） 遮屏选含「᰼᰼」候选项
--      - lua_filter@comment_filter_plus             --（引lua资料夹）（Mount_ocm） 遮屏提示码，开关（simplify_comment）（遇到「'/」不遮屏）。
--      - lua_filter@symbols_mark_filter             --（关，但 mix_cf2_cfp_smf_filter 有用到某元件，部分开启） 候选项注释符号、音标等属性之提示码(comment)（用 opencc 可实现，但无法合并其他提示码(comment)，改用 Lua 来实现）
--      - lua_filter@missing_mark_filter             --（关） 补上标点符号因直上和 opencc 冲突没附注之选项
--      - lua_filter@array30_comment_filter          --（关） 遮屏提示码，开关（simplify_comment）（遇到「`」不遮屏）
--      - lua_filter@array30_nil_filter              --（引lua资料夹）（onion-array30） 行列30空码'⎔'转成不输出任何符号，符合原生。後来移至「=」「=」反查用。
--      - lua_filter@array30_spaceup_filter          --（关） 行列30开关一二码按空格後，是否直上或可能有选单。
--      - lua_filter@en_sort_filter                  --（引lua资料夹）（easy_en_super和其挂接）如同英汉字典一样排序，候选项重新排序。开关（en_sort）
--      - lua_filter@kr_hnc_1m_filter                --（引lua资料夹）（hangeul_hnc）韩语遮屏只剩一个选项。开关（kr_1m）
--      - lua_filter@convert_english_filter          --（引lua资料夹）easy 英文尾缀「;」或「;;」生成全大写或首字母大写。後来合并修改为挂接方案也可使用。
--      - lua_filter@p_convert_english_filter        --（关）同 convert_english_filter，挂接方案用。
--      - lua_filter@convert_japan_filter            --（引lua资料夹）日文出罗马字、全形罗马字、半形片假名、全片假名、全平假名。後来合并修改为挂接方案也可使用。
--      - lua_filter@p_convert_japan_filter          --（关）同 convert_japan_filter，挂接方案用。
--      - lua_filter@halfwidth_katakana_filter       --（关）（jpnin1）片假名後附加半形片假名。选单显示太杂乱，故不用。
--      - lua_filter@lua_custom_phrase_filter        --（关）取代原先 table_translator@custom_phrase。接续挂接方案後，有 bug，上不了屏，改用 translator 实现。
--      - lua_filter@preedit_model_filter            --（引lua资料夹）（bo_mixin 全系列）切换 preedit 样式
--
--      - ＊合并两个以上函数：
--      - lua_filter@mix30_nil_comment_filter        --（关） 合并 array30_nil_filter 和 array30_comment_filter，两个 lua filter 太耗效能。
--      - lua_filter@mix30_nil_comment_up_filter     --（引lua资料夹）（onion-array30） 合并 array30_nil_filter 和 array30_comment_filter 和 array30_spaceup_filter，三个 lua filter 太耗效能。
--      - lua_filter@mix_cf2_miss_filter             --（引lua资料夹）（bopomo_onionplus 和 bo_mixin 全系列） 合并 charset_filter2 和 missing_mark_filter，两个 lua filter 太耗效能。
--      - lua_filter@mix_cf2_cfp_filter              --（引lua资料夹）（dif1） 合并 charset_filter2 和 comment_filter_plus，两个 lua filter 太耗效能。
--      - lua_filter@mix_cf2_cfp_smf_filter          --（关）（ocm_mixin） 合并 charset_filter2 和 comment_filter_plus 和 symbols_mark_filter，三个 lua filter 太耗效能。
--      - lua_filter@ocm_mixin_filter                --（引lua资料夹）（ocm_mixin）同上条目，comment 附加改用 opencc 方式。
--
--
--      《 ＊ 以下「处理」注意在 processors 中的顺序，基本放在最前面 》
--      - lua_processor@endspace                     --（关） （hangeul 和 hangeul2set） 韩语（非英语等）空格键後添加" "（该方式无法记录到用户词典，故使用原生程式另外方式达成该项功能）
--      - lua_processor@ascii_punct_change           --（引lua资料夹）（bopomo_onionplus_2和3） 注音非 ascii_mode 时 ascii_punct 转换後按 '<' 和 '>' 能输出 ',' 和 '.'
--      - lua_processor@array30up                    --（关） 行列30三四码字按空格直接上屏
--      - lua_processor@array30up_zy                 --（关） 行列30注音反查 Return 和 space 上屏修正
--      - lua_processor@p_open_files/p_run_files     --（关） （bopomo_onionplus_2）快捷键开启档案/程式/网站
--
--      = 以下针对「编码有用到空白键」方案，如：注音一声，去除空白上屏产生莫名之空格 =
--      - lua_processor@s2r_ss                       --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（只有开头 ^'/ 才作用，比下条目更精简，少了 is_composing 限定）
--      - lua_processor@s2r_s                        --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（只有开头 ^'/ 才作用）
--      - lua_processor@s2r                          --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（ mixin(1,2,4)和 plus 用）
--      - lua_processor@s2r_e_u                      --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（只针对 email 和 url ）
--      - lua_processor@s2r_most                     --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（ mixin(1,2,4)和 plus 用，精简写法）
--      - lua_processor@s2r_mixin3                   --（关） 注音挂接 t2_translator 空白上屏产生莫名空格去除（ mixin3 (特殊正则)专用）
--      - lua_processor@mobile_bpmf                  --（引lua资料夹）（手机注音专用） 使 email_url_translator 功能按空白都能直接上屏
--      - lua_processor@kr_2set_0m_choice            --（引lua资料夹）（hangeul2set_zeromenu）韩语成零选项。开关（space_mode）、开关（kr_0m）
--      - lua_processor@kr_2set_0m                   --（关）（hangeul2set_zeromenu）韩语成零选项。开关（space_mode）
--      - lua_processor@zhuyin_space                 --（引lua资料夹）（Mount_ocm）补注音反查无法使用空白键和选字後跳掉之 bug。
--      - lua_processor@lua_tran_kp                  --（关）（bopomo_onion_double）使 lua 之 mf_translator 数字和计算机功能可用小键盘输入。
--
--      - ＊合并两个以上函数：
--      - lua_processor@array30up_mix                --（引lua资料夹）（onion-array30） 合并 array30up 和 array30up_zy，增进效能。
--      - lua_processor@mix_apc_s2rm_ltk             --（引lua资料夹）（bo_mixin 1、2、4；bopomo_onionplus） 合并 ascii_punct_change、s2r_most、lua_tran_kp，增进效能。
--      - lua_processor@mix_apc_s2rm_ltk_3           --（引lua资料夹）（bo_mixin3） 合并 ascii_punct_change、s2r_mixin3、lua_tran_kp，增进效能。
--      - lua_processor@mix_apc_ltk_pluss            --（引lua资料夹）（bopomo_onionplus_space） 以原 ascii_punct_change 增加功能，使初始空白可以直接上屏。
--      - lua_processor@mix_zhs_ltk                  --（引lua资料夹）（ocm_mixin、dif1、ocm_mix） 合并 zhuyin_space 和 lua_tran_kp。
--      - lua_processor@mix_kp_return                --（引lua资料夹）（bopomo_onion_double） 合并 lua_tran_kp 并增加 return 上屏模式切换。
--      ...




--[[
挂接备注：

如果 lua 资料夹档案最後 return {table} ，挂接使用：
local 档名 = require("档名")
函数名 = 档名.函数名

如果 lua 资料夹档案最後 return 函数名 ，挂接使用：
函数名 = require("档名")
--]]




-- --[[
-- 以下防 opencc 记忆体问题
-- 但开启後 lua 的 opencc 函数无法正常作用
-- memory leak issue
-- --]]
-- -- bypass
-- Opencc=function(fs)
--   return  {
--     convert= function(self,text) return text end,
--     convert_text = function(self,text) return text end,
--     convert_word= function(self,text) return end,
--     random_convert_text = function(self,text) return text end,
--   }
-- end




--[[
--------------------------------------------
！！！！以下为 filter 挂接！！！！
--------------------------------------------
--]]


--- charset cjk filter 系列
-- charset_cjk_filter: 滤除含 CJK 扩展汉字的候选项
-- charset_comment_filter: 为候选项加上其所属字符集的注释
local charset_cjk = require("filter_charset_cjk")
charset_cjk_filter = charset_cjk.charset_cjk_filter
charset_comment_filter = charset_cjk.charset_comment_filter
--- charset_cjk_filter_plus （bopomo_onion_double）
-- 同上，将滤除含 CJK 扩展汉字的候选项，增加开关设置
charset_cjk_filter_plus = charset_cjk.charset_cjk_filter_plus


--- comment_filter_plus （Mount_ocm）
-- 去除後面编码注释
comment_filter_plus = require("filter_comment_filter_plus")


--- array30_nil_filter （onion-array30）
-- 後来移至「=」「=」反查用。行列30空码'⎔'转成不输出任何符号，符合原生
array30_nil_filter = require("filter_array30_nil_filter")


--- mix_cf2_miss_filter （bopomo_onionplus 和 bo_mixin 全系列）
-- 合并 charset_filter2 和 missing_mark_filter，两个 lua filter 太耗效能。
mix_cf2_miss_filter = require("filter_mix_cf2_miss_filter")


--- mix_cf2_cfp_filter （dif1）
-- 合并 charset_filter2 和 comment_filter_plus，两个 lua filter 太耗效能。
mix_cf2_cfp_filter = require("filter_mix_cf2_cfp_filter")
mix30_nil_comment_up_filter = require("filter_mix30_nil_comment_up_filter")


--- preedit_model_filter （bo_mixin 全系列）
-- 切换 preedit 样式
preedit_model_filter = require("filter_preedit_model_filter")


--- en_sort_filter （easy_en_super）
-- 如同英汉字典一样排序，候选项重新排序。开关（en_sort）
en_sort_filter = require("filter_en_sort_filter")


--- kr_hnc_1m_filter （hangeul_hnc）
-- 韩语遮屏只剩一个选项。开关（kr_1m）
kr_hnc_1m_filter = require("filter_kr_hnc_1m_filter")


-- --- mix_cf2_cfp_smf_filter （ocm_mixin）
-- -- 没用到 ocm_mixin 方案时，ReverseDb("build/symbols-mark.reverse.bin")会找不到。
-- -- 故改用下条目 opencc 应用。
-- -- mix_cf2_cfp_smf_filter = require("filter_mix_cf2_cfp_smf_filter") --无效
-- local filter_mix_cf2_cfp_smf_filter = require("filter_mix_cf2_cfp_smf_filter")
-- mix_cf2_cfp_smf_filter = filter_mix_cf2_cfp_smf_filter.mix_cf2_cfp_smf_filter
-- mix_cf2_cfp_smf_filter = require("filter_mix_cf2_cfp_smf_filter")


--- ocm_mixin_filter （ocm_mixin）
-- 同上条目，但附加 comment 不用 ReverseDb 方式，改用新版 lua 的 opencc 引入方式。
-- local filter_ocm_mixin = require("filter_ocm_mixin")
-- ocm_mixin_filter = filter_ocm_mixin.ocm_mixin_filter
ocm_mixin_filter = require("filter_ocm_mixin")


--- charset_filter2 （ocm_onionmix）（手机全方案会用到）
-- 把 opencc 转换成「᰼」(或某个符号)，再用 lua 功能去除「᰼」
-- charset_filter2 = require("filter_charset_filter2")
-- local filter_charset_filter2 = require("filter_charset_filter2")
-- charset_filter2 = filter_charset_filter2.charset_filter2
charset_filter2 = require("filter_charset_filter2")


--- 日文出罗马字、全形罗马字、半形片假名、全片假名、全平假名。
-- convert_japan_filter：主方案用。後来合并修改为挂接方案也可使用。
-- p_convert_japan_filter：挂接方案用，方案名称：「japan」。
-- 用 filter 方式。
-- local c_j_filter = require("filter_convert_japan_filter")
-- convert_japan_filter = c_j_filter.convert_japan_filter
-- p_convert_japan_filter = c_j_filter.p_convert_japan_filter
convert_japan_filter = require("filter_convert_japan_filter")


--- easy 英文尾缀「;」或「;;」生成全大写或首字母大写。
-- convert_english_filter：主方案用。後来合并修改为挂接方案也可使用。
-- p_convert_english_filter：挂接方案用。
-- 用 filter 方式。
-- local c_e_filter = require("filter_convert_english_filter")
-- convert_english_filter = c_e_filter.convert_english_filter
-- p_convert_english_filter = c_e_filter.p_convert_english_filter
convert_english_filter = require("filter_convert_english_filter")


-- --- halfwidth_katakana_filter (jpnin1)
-- -- 片假名後附加半形片假名。
-- -- 选单显示太杂乱，故不用。
-- -- 改用 convert_japan_translator 出半形片假名。
-- local filter_halfwidth_katakana_filter = require("filter_halfwidth_katakana_filter")
-- halfwidth_katakana_filter = filter_halfwidth_katakana_filter.halfwidth_katakana_filter
-- halfwidth_katakana_filter = require("filter_halfwidth_katakana_filter")


-- --- lua_custom_phrase_filter
-- -- 取代原先 table_translator@custom_phrase。
-- -- 可多行，用\n\r。
-- -- 接续挂接方案後，有 bug，上不了屏，改用 translator 实现。
-- lua_custom_phrase_filter = require("filter_lua_custom_phrase_filter")




--[[
--------------------------------------------
！！！！以下为 processor 挂接！！！！
--------------------------------------------
--]]


--- ascii_punct_change （bopomo_onionplus_2和3）
-- 改变标点符号
-- 於注音方案改变在非 ascii_mode 时 ascii_punct 转换後按 '<' 和 '>' 能输出 ',' 和 '.'
ascii_punct_change = require("processor_ascii_punct_change")


--- array30up_mix （onion-array30）
-- 合并 array30up 和 array30up_zy
-- 行列30三四码字按空格直接上屏
-- 行列30注音反查 Return 和 space 上屏修正
array30up_mix = require("processor_array30up_mix")


--- mix_apc_s2rm_ltk （bo_mixin 1、2、4；bopomo_onionplus）
-- 合并 ascii_punct_change、s2r_most、lua_tran_kp，增进效能。
mix_apc_s2rm_ltk = require("processor_mix_apc_s2rm_ltk")


--- mix_apc_s2rm_ltk_3 （bo_mixin3）
-- 合并 ascii_punct_change、s2r_mixin3、lua_tran_kp，增进效能。
mix_apc_s2rm_ltk_3 = require("processor_mix_apc_s2rm_ltk_3")


--- mix_apc_ltk_pluss （bopomo_onionplus_space）
-- 以原 ascii_punct_change 增加功能
-- 使初始空白可以直接上屏
-- 於注音方案改变在非 ascii_mode 时 ascii_punct 转换後按 '<' 和 '>' 能输出 ',' 和 '.'
mix_apc_ltk_pluss = require("processor_mix_apc_ltk_pluss")


--- zhuyin_space （Mount_ocm）
-- 补注音反查无法使用空白键和选字後跳调之 bug。
zhuyin_space = require("processor_zhuyin_space")


-- --- lua_tran_kp （bopomo_onion_double）
-- -- 使 lua 之 mf_translator 数字和计算机功能可用小键盘输入。
-- lua_tran_kp = require("processor_lua_tran_kp")


--- mix_kp_return （bopomo_onion_double）
-- 使 lua 之 mf_translator 数字和计算机功能可用小键盘输入。
-- 使 return 上屏模式切换
mix_kp_return = require("processor_mix_kp_return")


--- mix_zhs_ltk （ocm_mixin、dif1、ocm_onionmix）
-- 合并 zhuyin_space 和 lua_tran_kp
mix_zhs_ltk = require("processor_mix_zhs_ltk")


--- kr_2set_0m_choice （hangeul2set_zeromenu）
-- 韩语成零选项。开关（space_mode）、开关（kr_0m）
kr_2set_0m_choice = require("processor_kr_2set_0m_choice")


-- --- kr_2set_0m （hangeul2set_zeromenu）
-- -- 韩语成零选项。开关（space_mode）
-- kr_2set_0m = require("processor_kr_2set_0m")


-- --- p_open_files （bopomo_onionplus_2）
-- -- 快捷键开启档案/程式/网站
-- -- p_open_files：英文字母开启/p_run_files：上屏键开启。
-- -- p_open_files = require("processor_p_open_files")
-- p_run_files = require("processor_p_run_files")




-- --- mobile_bpmf （手机注音用）
-- -- 使 email_url_translator 功能按空白都能直接上屏
-- mobile_bpmf = require("processor_mobile_bpmf")




--[[
--------------------------------------------
！！！！以下为 translator 挂接！！！！
--------------------------------------------
--]]


--- email_url_translator
-- 把 recognizer 正则输入 email 使用 lua 实现，使之有选项，避免设定空白清屏时无法上屏。
-- 把 recognizer 正则输入网址使用 lua 实现，使之有选项，避免设定空白清屏时无法上屏。
-- 可多加「www.」
email_url_translator = require("translator_email_url_translator")


--- instruction_grave_bpmf
-- 说明注音「`」开头之符号集
instruction_grave_bpmf = require("translator_instruction_grave_bpmf")


--- instruction_dbpmf
-- 说明双拼注音各种挂接
instruction_dbpmf = require("translator_instruction_dbpmf")


--- instruction_ocm
-- 说明虾米各种挂接
instruction_ocm = require("translator_instruction_ocm")


--- t_translator 系列
-- 合并 t_translator 和 t2_translator 为 mf_translator。
-- t_translator = require("translator_time_translator")
-- t2_translator = require("translator_time2_translator")
mf_translator = require("translator_multifunction_translator")


--- lua_custom_phrase
-- 取代原先 table_translator@custom_phrase。
-- 可多行，用\n\r。
lua_custom_phrase = require("translator_lua_custom_phrase")


-- --- 日文出罗马字、全形罗马字、半形片假名、全片假名、全平假名。
-- -- （关）（效能不佳）用 translator 方式。
-- -- convert_japan_translator：主方案用。
-- -- p_convert_japan_translator：挂接方案用，方案名称：「japan」。
-- local c_j_translator = require("translator_convert_japan_translator")
-- convert_japan_translator = c_j_translator.convert_japan_translator
-- p_convert_japan_translator = c_j_translator.p_convert_japan_translator



-- Rime Lua 扩展 https://github.com/hchunhui/librime-lua
-- 文档 https://github.com/hchunhui/librime-lua/wiki/Scripting

-- processors:

-- 以词定字，可在 default.yaml → key_binder 下配置快捷键，默认为左右中括号 [ ]
select_character = require("select_character")

-- translators:

-- 日期时间，可在方案中配置触发关键字。
date_translator = require("date_translator")

-- 农历，可在方案中配置触发关键字。
lunar = require("lunar")

-- Unicode，U 开头
unicode = require("unicode")

-- 数字、人民币大写，R 开头
number_translator = require("number_translator")

-- filters:

-- 错音错字提示
-- 关闭此 Lua 时，同时需要关闭 translator/spelling_hints，否则 comment 里都是拼音
corrector = require("corrector")

-- v 模式 symbols 优先（全拼）
v_filter = require("v_filter")

-- 自动大写英文词汇
autocap_filter = require("autocap_filter")

-- 降低部分英语单词在候选项的位置，可在方案中配置要降低的模式和单词
reduce_english_filter = require("reduce_english_filter")

-- 辅码，https://github.com/mirtlecn/rime-radical-pinyin/blob/master/search.lua.md
search = require("search")

-- 置顶候选项
pin_cand_filter = require("pin_cand_filter")

-- 长词优先（全拼）
long_word_filter = require("long_word_filter")

-- 默认未启用：

-- 中英混输词条自动空格
-- 在 engine/filters 增加 - lua_filter@cn_en_spacer
cn_en_spacer = require("cn_en_spacer")

-- 英文词条上屏自动添加空格
-- 在 engine/filters 的倒数第二个位置，增加 - lua_filter@en_spacer
en_spacer = require("en_spacer")

-- 九宫格，将输入框的数字转为对应的拼音或英文，iRime 用，Hamster 不需要。
-- 在 engine/filters 增加 - lua_filter@t9_preedit
t9_preedit = require("t9_preedit")

-- 根据是否在用户词典，在 comment 上加上一个星号 *
-- 在 engine/filters 增加 - lua_filter@is_in_user_dict
-- 在方案里写配置项：
-- is_in_user_dict: true     为输入过的内容加星号
-- is_in_user_dict: false    为未输入过的内容加星号
is_in_user_dict = require("is_in_user_dict")

-- 词条隐藏、降频
-- 在 engine/processors 增加 - lua_processor@cold_word_drop_processor
-- 在 engine/filters 增加 - lua_filter@cold_word_drop_filter
-- 在 key_binder 增加快捷键：
-- turn_down_cand: "Control+j"  # 匹配当前输入码后隐藏指定的候选字词 或候选词条放到第四候选位置
-- drop_cand: "Control+d"       # 强制删词, 无视输入的编码
-- get_record_filername() 函数中仅支持了 Windows、macOS、Linux
cold_word_drop_processor = require("cold_word_drop.processor")
cold_word_drop_filter = require("cold_word_drop.filter")


-- 暴力 GC
-- 详情 https://github.com/hchunhui/librime-lua/issues/307
-- 这样也不会导致卡顿，那就每次都调用一下吧，内存稳稳的
function force_gc()
    -- collectgarbage()
    collectgarbage("step")
end

-- 临时用的
function debug_checker(input, env)
    for cand in input:iter() do
        yield(ShadowCandidate(
            cand,
            cand.type,
            cand.text,
            env.engine.context.input .. " - " .. env.engine.context:get_preedit().text .. " - " .. cand.preedit
        ))
    end
end
