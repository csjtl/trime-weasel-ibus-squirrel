#!/bin/zsh

# 词典yaml类型（一个表情	一个文本）
Func_EmojiDict(){
    Preprocessing $1 $2

    # 设置分隔符 \n 来提取每行
    local IFS=$'\n'
    for every_line in $(cat $TMPFILE0)
    do

    # 进度条打印
    Progress_Bar $2

    # 每行分割为几份
    local quantity=`echo $every_line | awk -F"	" '{print NF}'`

    # 处理每行
    for ((i=2; i<=$quantity; ++i)){
        local var1=`echo ${every_line} | awk -F '	' '{print $1}'`
        local var2=`echo ${every_line} | awk -F '	' '{print $"'${i}'"}'`
        txtbig=${#var2}

        # 文本大小为零跳过
        if [ "$txtbig" != "0" ];then
            if [ -n "$var2" ];then
                # 一个表情TAB一个文本
                local var3="${var1}	${var2}"
                echo ${var3} >> $TMPFILE1
            fi
        fi
    }
    done

    # 制表符替换为制表符?
    sed -i 's/	/	?/g' $TMPFILE1

    # 排序去重
    sort -u $TMPFILE1 > $2

    # 文件插入标头
    sed -i '1i\'$3'' $2
}


# Txt类型（一个文本	一个文本 一个表情）
Func_EmojiTxt(){
    Preprocessing $1 $2

    # 设置分隔符 \n 来提取每行
    local IFS=$'\n'
    for every_line in $(cat $TMPFILE0)
    do

    # 进度条打印
    Progress_Bar $2

    # 每行分割为几份
    local quantity=`echo $every_line | awk -F"	" '{print NF}'`
    # 处理每行
    for ((i=2; i<=$quantity; ++i)){
        local var1=`echo ${every_line} | awk -F '	' '{print $1}'`
        local var2=`echo ${every_line} | awk -F '	' '{print $"'${i}'"}'`
        txtbig=${#var2}

        # 文本大小为零跳过
        if [ "$txtbig" != "0" ];then
            line_num=$(awk "/	$var2 /{print NR}" "$TMPFILE1")
            awk '/	'$var2' / {print $0}' "$TMPFILE1" > $TMPFILE2

            # 一个文本TAB一个文本空格多个表情
            if [ -n "$line_num" ];then

                # 是否以存在相同文本
                result=$(grep -o "$var1" $TMPFILE2 | wc -l)
                if [[ "$result" == "0" ]];then
                    # 不包含 行尾追加
                    sed -i '/	'$var2' /s/$/ '$var1'/' $TMPFILE1
                fi
            else
                # 新行添加
                local var3="${var2}	${var2} ${var1}"
                echo ${var3} >> $TMPFILE1
            fi
        fi
    }
    done

    # 空格替换为制表符
    #sed -i 's/ /	/g' $TMPFILE1

    # 排序去重
    sort -u $TMPFILE1 > $2
}

Func_GrammarDict(){
    Preprocessing $1 $2

    # 设置分隔符 \n 来提取每行
    local IFS=$'\n'
    for every_line in $(cat $TMPFILE0)
    do

    # 进度条打印
    Progress_Bar

    # 每行分割为几份
    local quantity=`echo $every_line | awk -F"	" '{print NF}'`

    # 处理每行
    for ((i=2; i<=$quantity; ++i)){
        local var1=`echo ${every_line} | awk -F '	' '{print $1}'`
        local var2=`echo ${every_line} | awk -F '	' '{print $"'${i}'"}'`
        # 字符串转小写
        local var2=`echo ${var2} | awk '{print tolower($0)}'`
        # 字符串转大写
        #local var2=`echo ${var2} | awk '{print toupper($0)}'`

        txtbig=${#var2}

        # 文本大小为零跳过
        if [ "$txtbig" != "0" ];then
            if [ -n "$var2" ];then
                # 一句语法TAB一个单词
                local var3="${var1}	${var2}"
                echo ${var3} >> $TMPFILE1
            fi
        fi
    }
    done

    # 制表符替换为制表符-
    sed -i 's/	/	-/g' $TMPFILE1

    # 排序去重
    sort -u $TMPFILE1 > $2

    # 文件插入标头
    sed -i '1i\'$3'' $2
}

Preprocessing(){
    TMPFILE0=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    TMPFILE1=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    TMPFILE2=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1

    # 删除空行
    sed -e '/^$/d' $1 > $TMPFILE0

    # 删除注释
    #sed -i '/#/d' $TMPFILE0

    # 连续空格替换为一个空格
    sed -i 's/ \{2,\}/ /g' $TMPFILE0

    # 连续制表符替换为一个制表符
    sed -i 's/	\{2,\}/	/g' $TMPFILE0

    # 转义特殊字符
    #sed -i "s/[!@#$%^&*()-]/\\\&/g" $TMPFILE0

    # 进度条参数打印
    line_0=1
    line_all=$(awk 'END{print NR}' $TMPFILE0)
    line_one=$(echo "scale=6;$line_all/100"|bc)
    line_one=$(echo "scale=6;1/$line_one"|bc)

    ch=('|' '\' '-' '/')
    index=0
    printf "map 文件名: $1\n"
    printf "输出目录: $2\n"
    printf "总行数: $line_all\n"

}

Progress_Bar(){
    # 开始处理每行 进度条打印
    #clear
    if [ "$line_0" != "$line_all" ];then
        star=$(echo "scale=2;$line_0*$line_one"|bc)
        num=$(echo ${star%.*})
        if ((num == 0 )); then
            str=' '
        elif ((num <= 1 )); then
            str='#'
        elif ((num == 2)); then
            str='##'
        elif ((num == 3)); then
            str='###'
        elif ((num == 4)); then
            str='####'
        elif ((num == 5)); then
            str='#####'
        elif ((num == 6)); then
            str='######'
        elif ((num == 7)); then
            str='#######'
        elif ((num == 8)); then
            str='########'
        elif ((num == 9)); then
            str='#########'
        elif ((num == 10)); then
            str='##########'
        elif ((num == 11)); then
            str='###########'
        elif ((num == 12)); then
            str='############'
        elif ((num == 13)); then
            str='#############'
        elif ((num == 14)); then
            str='##############'
        elif ((num == 15)); then
            str='###############'
        elif ((num == 16)); then
            str='################'
        elif ((num == 17)); then
            str='#################'
        elif ((num == 18)); then
            str='##################'
        elif ((num == 19)); then
            str='###################'
        elif ((num == 20)); then
            str='####################'
        elif ((num == 21)); then
            str='#####################'
        elif ((num == 22)); then
            str='######################'
        elif ((num == 23)); then
            str='#######################'
        elif ((num == 24)); then
            str='########################'
        elif ((num == 25)); then
            str='#########################'
        elif ((num == 26)); then
            str='##########################'
        elif ((num == 27)); then
            str='###########################'
        elif ((num == 28)); then
            str='############################'
        elif ((num == 29)); then
            str='#############################'
        elif ((num == 30)); then
            str='##############################'
        elif ((num == 31)); then
            str='###############################'
        elif ((num == 32)); then
            str='################################'
        elif ((num == 33)); then
            str='#################################'
        elif ((num == 34)); then
            str='##################################'
        elif ((num == 35)); then
            str='###################################'
        elif ((num == 36)); then
            str='####################################'
        elif ((num == 37)); then
            str='#####################################'
        elif ((num == 38)); then
            str='######################################'
        elif ((num == 39)); then
            str='#######################################'
        elif ((num == 40)); then
            str='########################################'
        elif ((num == 41)); then
            str='#########################################'
        elif ((num == 42)); then
            str='##########################################'
        elif ((num == 43)); then
            str='###########################################'
        elif ((num == 44)); then
            str='############################################'
        elif ((num == 45)); then
            str='#############################################'
        elif ((num == 46)); then
            str='##############################################'
        elif ((num == 47)); then
            str='###############################################'
        elif ((num == 48)); then
            str='################################################'
        elif ((num == 49)); then
            str='#################################################'
        elif ((num == 50)); then
            str='##################################################'
        elif ((num == 51)); then
            str='###################################################'
        elif ((num == 52)); then
            str='####################################################'
        elif ((num == 53)); then
            str='#####################################################'
        elif ((num == 54)); then
            str='######################################################'
        elif ((num == 55)); then
            str='#######################################################'
        elif ((num == 56)); then
            str='########################################################'
        elif ((num == 57)); then
            str='#########################################################'
        elif ((num == 58)); then
            str='##########################################################'
        elif ((num == 59)); then
            str='###########################################################'
        elif ((num == 60)); then
            str='############################################################'
        elif ((num == 61)); then
            str='#############################################################'
        elif ((num == 62)); then
            str='##############################################################'
        elif ((num == 63)); then
            str='###############################################################'
        elif ((num == 64)); then
            str='################################################################'
        elif ((num == 65)); then
            str='#################################################################'
        elif ((num == 66)); then
            str='##################################################################'
        elif ((num == 67)); then
            str='###################################################################'
        elif ((num == 68)); then
            str='####################################################################'
        elif ((num == 69)); then
            str='#####################################################################'
        elif ((num == 70)); then
            str='######################################################################'
        elif ((num == 71)); then
            str='#######################################################################'
        elif ((num == 72)); then
            str='########################################################################'
        elif ((num == 73)); then
            str='#########################################################################'
        elif ((num == 74)); then
            str='##########################################################################'
        elif ((num == 75)); then
            str='###########################################################################'
        elif ((num == 76)); then
            str='############################################################################'
        elif ((num == 77)); then
            str='#############################################################################'
        elif ((num == 78)); then
            str='##############################################################################'
        elif ((num == 79)); then
            str='###############################################################################'
        elif ((num == 80)); then
            str='################################################################################'
        elif ((num == 81)); then
            str='#################################################################################'
        elif ((num == 82)); then
            str='##################################################################################'
        elif ((num == 83)); then
            str='###################################################################################'
        elif ((num == 84)); then
            str='####################################################################################'
        elif ((num == 85)); then
            str='#####################################################################################'
        elif ((num == 86)); then
            str='######################################################################################'
        elif ((num == 87)); then
            str='#######################################################################################'
        elif ((num == 88)); then
            str='########################################################################################'
        elif ((num == 89)); then
            str='#########################################################################################'
        elif ((num == 90)); then
            str='##########################################################################################'
        elif ((num == 91)); then
            str='###########################################################################################'
        elif ((num == 92)); then
            str='############################################################################################'
        elif ((num == 93)); then
            str='#############################################################################################'
        elif ((num == 94)); then
            str='##############################################################################################'
        elif ((num == 95)); then
            str='###############################################################################################'
        elif ((num == 96)); then
            str='################################################################################################'
        elif ((num == 97)); then
            str='#################################################################################################'
        elif ((num == 98)); then
            str='##################################################################################################'
        elif ((num == 99)); then
            str='###################################################################################################'
        else
            echo "进度条判断 error"
            exit
        fi
        printf "Progress:[%-100s][%d%%][%c]\r" $str $star ${ch[$index]}
        let line_0++
        let index=line_0%5
    else
        # 最后时行打印 100%
        str='####################################################################################################'
        printf "Progress:[%-100s][%d%%][%c]\r" $str 100 ${ch[$index]}
        printf "\n"
    fi
}

CleanUp(){
    echo "Removing temporary file..."
    rm -rf /tmp/customtemplate*
    exit
}


main(){
    # emoji 列表网站：https://www.unicode.org/emoji/charts/emoji-list.html
    # 中文转拼音网站：https://www.pinyinzi.cn/

    ########################################################################################################################################
    ########################################################## 使用 map-emoji-en.txt #######################################################
    ########################################################################################################################################
    MapPath_Emoji_en=map-emoji-en.txt

    ###### OpenCC 英文
    OutPath_Emoji_en=../opencc/emoji_en.txt
    Func_EmojiTxt $MapPath_Emoji_en $OutPath_Emoji_en

    ###### 英文 yaml 词典
    DictOutPath_Emoji_en=../dicts_en/emoji_ed.dict.yaml
    DictHead_Emoji_en="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_ed\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"
    Func_EmojiDict $MapPath_Emoji_en $DictOutPath_Emoji_en $DictHead_Emoji_en

    #######################################################################################################################################
    ######################################################## 使用 map-emoji-cn.txt ########################################################
    ########################################################################################################################################
    MapPath_Emoji_cn=map-emoji-cn.txt

    ###### OpenCC 中文
    OutPath_Emoji_cn=../opencc/emoji_cn.txt
    Func_EmojiTxt $MapPath_Emoji_cn $OutPath_Emoji_cn

    ###### 中文汉字 yaml 词典
    #EmojiCDPath=../dicts_cn/emoji_cd.dict.yaml
    #EmojiCDHead="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_cd\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"
    #Func_EmojiDict $MapPath_Emoji_cn $EmojiCDPath $EmojiCDHead

    #######################################################################################################################################
    ######################################################## 使用 map-emoji-cn-pinyin.txt #################################################
    #######################################################################################################################################
    MapPath_Emoji_cn_pinyin=map-emoji-cn-pinyin.txt

    ###### 中文pinyin yaml 转为拼音编码
    OutPath_Emoji_cn_pinyin=../dicts_cn/emoji_cd_pin.dict.yaml
    DictHead_Emoji_cn_pinyin="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_cd_pin\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"
    Func_EmojiDict $MapPath_Emoji_cn_pinyin $OutPath_Emoji_cn_pinyin $DictHead_Emoji_cn_pinyin

    ###### 中文五笔 yaml 转为五笔编码（无五笔编码，使用拼音编码）
    #MapPath_Emoji_cn_wubi=emoji-cn-map-wubi.txt
    EmojiCDWPath=../dicts_cn/emoji_cd_five.dict.yaml
    DictHead_Emoji_cn_wubi="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_cd_five\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"
    Func_EmojiDict $MapPath_Emoji_cn_pinyin $EmojiCDWPath $DictHead_Emoji_cn_wubi

    ########################################################################################################################################
    ############################################################ 使用 map-grammar.txt ######################################################
    ########################################################################################################################################
    MapPath_Emoji_en_grammar=map-grammar.txt

    ###### 语法 yaml 格式
    OutPath_Emoji_en_grammar=../dicts_en/english_grammar.dict.yaml
    DictHead_Emoji_en_grammar="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 牛津词典中的 语法\n#\n# 查询方式：\n# 1. 字符串首字母大写及前加-：-abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:pppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: english_grammar\nversion: "1.0"\nsort: by_weight\nuse_preset_vocabulary: false\n...\n"
    Func_GrammarDict $MapPath_Emoji_en_grammar $OutPath_Emoji_en_grammar $DictHead_Emoji_en_grammar

    CleanUp
}

main "$@"



