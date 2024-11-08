#!/bin/zsh

# 词典yaml类型（一个表情	一个文本）
EmojiDict(){
    local TMPFILE0=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    local TMPFILE1=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    local TMPFILE2=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1

    # 删除注释
    sed -e '/#/d' $1 > $TMPFILE0

    # 删除空行
    sed -i '/^$/d' $TMPFILE0

    # 删除行尾空格
    sed -i 's/[ ]*$//g' $TMPFILE0

    # 连续空格替换为一个空格
    sed -i 's/ \{2,\}/ /g' $TMPFILE0

    # 转义特殊字符
    #sed -i "s/[!@#$%^&*()-]/\\\&/g" $TMPFILE0

    # 进度条参数打印
    str='#'
    schedule_0=1
    schedule_100=$(awk 'END{print NR}' $TMPFILE0)
    ch=('|' '\' '-' '/')
    index=0

    # 开始处理每行
    local IFS=$'\n'
    for every_line in $(cat $TMPFILE0)
    do

    # 进度条打印
    clear
    printf "$2\n[%-"$schedule_100"s][%c]\r" $str ${ch[$index]}
    str+='#'
    let schedule_0++
    let index=schedule_0%4
    printf "\n"

    # 每行分割为几份
    local quantity=`echo $every_line | awk -F"	" '{print NF}'`

    # 处理每行
    for ((i=2; i<=$quantity; ++i)){
        local var1=`echo ${every_line} | awk -F ' ' '{print $1}'`
        local var2=`echo ${every_line} | awk -F ' ' '{print $"'${i}'"}'`
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
EmojiTxt(){
    local TMPFILE0=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    local TMPFILE1=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1
    local TMPFILE2=$(mktemp /tmp/customtemplate.XXX.tmp) || exit 1

    # 删除注释
    sed -e '/#/d' $1 > $TMPFILE0

    # 删除空行
    sed -i '/^$/d' $TMPFILE0

    # 删除行尾空格
    sed -i 's/[ ]*$//g' $TMPFILE0

    # 连续空格替换为一个空格
    sed -i 's/ \{2,\}/ /g' $TMPFILE0

    # 转义特殊字符
    #sed -i "s/[!@#$%^&*()-]/\\\&/g" $TMPFILE0

    # 进度条参数
    str='#'
    schedule_0=1
    schedule_100=$(awk 'END{print NR}' $TMPFILE0)
    ch=('|' '\' '-' '/')
    index=0

    # 开始处理每行
    local IFS=$'\n'
    for every_line in $(cat $TMPFILE0)
    do

    # 进度条打印
    clear
    printf "$2\n[%-"$schedule_100"s][%c]\r" $str ${ch[$index]}
    str+='#'
    let schedule_0++
    let index=schedule_0%4
    printf "\n"

    # 每行分割为几份
    local quantity=`echo $every_line | awk -F"	" '{print NF}'`
    # 处理每行
    for ((i=2; i<=$quantity; ++i)){
        local var1=`echo ${every_line} | awk -F ' ' '{print $1}'`
        local var2=`echo ${every_line} | awk -F ' ' '{print $"'${i}'"}'`
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



CleanUp()
{
    echo "Removing temporary file..."
    rm -rf /tmp/customtemplate*
    exit
}


main(){
    # emoji 列表网站：https://www.unicode.org/emoji/charts/emoji-list.html
    # 中文转拼音网站：https://www.pinyinzi.cn/

    # map 文件路径（中文或英文）
    EmojiCnMapPath=map-emoji-cn.txt
    EmojiCnPMapPath=map-emoji-cn-pinyin.txt
    #EmojiCnWMapPath=emoji-cn-map-wubi.txt
    EmojiEnMapPath=map-emoji-en.txt

    # yaml 词典输出路径
    EmojiCDPath=../dicts_cn/emoji_cd.dict.yaml
    EmojiCDHead="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_cd\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"

    EmojiEDPath=../dicts_en/emoji_ed.dict.yaml
    EmojiEDHead="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_ed\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"

    # 中文 yaml 转为拼音编码
    EmojiCDPPath=../dicts_cn/emoji_cd_pin.dict.yaml
    EmojiCDPHead="# Rime dictionary\n# mim: set ts=8 sw=8 noet:\n# encoding: utf-8\n#\n# 搜索表情词典\n#\n# 查询方式：\n# 1. 字符串前加|后面小写字母：?abcdhijk\n# 2. 多单词连续输\n# 3. 字符串中出现的符号省略不输\n# 4. 某些字符的代表字母 +:p, #:ppp, 1;o, 2;t, 3;t, 4;f, 5;f, 6;s, 7;s, 8;e, 9;n, 0;z\n#\n# 个人的学习语法笔记\n# https://tl8517.com/docs/english-grammar/\n\n---\nname: emoji_cd_pin\nversion: "1.0"\nsort: by_original\nuse_preset_vocabulary: false\n...\n"
    # 中文 yaml 转为五笔编码
    #EmojiCDWPath=emoji_cd_five.dict.yaml

    # txt 格式输出路径
    EmojiCnPath=../opencc/emoji_cn.txt
    EmojiEnPath=../opencc/emoji_en.txt


    EmojiDict $EmojiCnMapPath $EmojiCDPath $EmojiCDHead
    EmojiDict $EmojiCnPMapPath $EmojiCDPPath $EmojiCDPHead
    #EmojiDict $EmojiCnWMapPath $EmojiCDWPath
    EmojiDict $EmojiEnMapPath $EmojiEDPath $EmojiEDHead

    EmojiTxt $EmojiCnMapPath $EmojiCnPath
    EmojiTxt $EmojiEnMapPath $EmojiEnPath

    CleanUp
}

main "$@"



