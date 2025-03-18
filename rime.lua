

--- charset cjk filter 系列
-- charset_cjk_filter: 滤除含 CJK 扩展汉字的候选项
-- charset_comment_filter: 为候选项加上其所属字符集的注释
local charset_cjk = require("five_strokes/filter_charset_cjk")
-- charset_cjk_filter = charset_cjk.charset_cjk_filter
charset_comment_filter = charset_cjk.charset_comment_filter
--- charset_cjk_filter_plus （bopomo_onion_double）
-- 同上，将滤除含 CJK 扩展汉字的候选项，增加开关设置
-- charset_cjk_filter_plus = charset_cjk.charset_cjk_filter_plus

