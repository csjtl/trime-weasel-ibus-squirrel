# rime-NewCenturyWubi-rimerc

功能:
    - 超大字符集专为输入“生僻字”(增广)
    - 简入繁出
    - 字符在 Unicode 区间的显示
    - Emoji表情

## 下载及安装

### 下载

1. 软件下载:
    - [同文-Trime](https://github.com/osfans/trime/releases)
    - [小狼毫-Weasel](https://rime.im/download/)
2. 配置文件:
    - [同文-Trime / 小狼毫-Weasel](https://github.com/csjtl/rime-NewCenturyWubi-rimerc)

### 安装

把相应文件夹内的文件 copy 到 rime (同文-Trime) / Rime(小狼毫-Weasel) 文件夹内, 覆盖原文件 (操作前备份保存一下).

## 配置

### 目录结构

#### 同文-Trime

|文件名|描述
|:----------------------------------:|:---
|build|文件夹 - 编译完成的可执行的文件
|fonts|文件夹 - 字体
|lua|文件夹 - 各类 lua 脚本
|opencc|文件夹 - OpenCC“滤镜”(转换库)
|pinyin_simp.userdb|文件夹 - 用户字典 pinyin_simp (文件夹名可自定义)
|rime_wubi.userdb|文件夹 - 用户字典 新世纪五笔 (文件夹名可自定义)
|sync|文件夹 - 同步文件夹
|default.custom.yaml|文件
|default.yaml|文件
|easy_en_super.dict.yaml|文件 - 方案easy_en_super方案词典文件
|easy_en_super.schema.yaml|文件 - 方案easy_en_super方案配置文件
|installation.yaml|文件
|key_bindings.yaml|文件
|pinyin_simp.dict.yaml|文件 - 方案pinyin_simp方案词典文件
|pinyin_simp.schema.yaml|文件 - 方案pinyin_simp方案配置文件
|punctuation.yaml|文件
|rime.lua|文件文件 -  lua 脚本的总入口
|symbols.yaml|文件
|TGboard.trime.yaml|文件 - TGboard主题
|tongwenfeng.trime.custom.yaml|文件 - tongwenfeng修改主题样式
|tongwenfeng.trime.yaml|文件 - tongwenfeng主题
|trime.custom.yaml|文件 - trime修改主题样式
|trime.yaml|文件 - trime主题
|user.yaml|文件
|wubi06_all.dict.yaml|文件 - 方案新世纪五笔方案词典文件
|wubi06_cjk.schema.yaml|文件 - 方案新世纪五笔方案配置文件
|wubi06_unicodecjk.dict.yaml|文件 - 方案新世纪五笔方案词典文件

#### 小狼毫-Weasel

|文件名|描述
|:----------------------------------:|:---
|build|文件夹 - 编译完成的可执行的文件
|lua|文件夹 - 各类 lua 脚本
|opencc|文件夹 - OpenCC“滤镜”(转换库)
|rime_wubi.userdb|文件夹 - 用户字典 新世纪五笔 (文件夹名可自定义)
|sync|文件夹 - 同步文件夹
|default.custom.yaml|文件
|easy_en_super.dict.yaml|文件 - 方案easy_en_super方案词典文件
|easy_en_super.schema.yaml|文件 - 方案easy_en_super方案配置文件
|installation.yaml|文件
|pinyin_simp.dict.yaml|文件 - 方案pinyin_simp方案词典文件
|pinyin_simp.schema.yaml|文件 - 方案pinyin_simp方案配置文件
|rime.lua|文件文件 -  lua 脚本的总入口
|user.yaml|文件
|weasel.custom.yaml|文件 - weasel修改主题样式
|wubi06_all.dict.yaml|文件 - 方案新世纪五笔方案词典文件
|wubi06_cjk.schema.yaml|文件 - 方案新世纪五笔方案配置文件
|wubi06_unicodecjk.dict.yaml|文件 - 方案新世纪五笔方案词典文件

### 目录文件

#### xxx.trime.yaml 同文主题 / weasel.custom.yaml 小狼毫主题

##### 同文-Trime

```txt
TGboard.trime.yaml
tongwenfeng.trime.custom.yaml
tongwenfeng.trime.yaml
trime.custom.yaml
trime.yaml
```

`trime.yaml / tongwenfeng.trime.yaml`: - 软件自带主题, 修改需编辑`trime.custom.yaml / tongwenfeng.trime.custom.yaml` 文件. 直接修改的话, 切换主题会还原默认状态.

1. `TGboard.trime.yaml`: 自用主题, 可直接编辑文件. 仿 Google Gboard 输入法的主题及配色
   TGboard样式图:
    - 新世纪五笔
    ![New-Century-Wubi](../assets/rime-scheme-configuration/New-Century-Wubi.webp)
    - 操作键
    ![操作键](../assets/rime-scheme-configuration/Operation-keys.webp)
    - 数字键
    ![数字键](../assets/rime-scheme-configuration/number-key.webp)
    - 符号键
    ![符号](../assets/rime-scheme-configuration/symbol.webp)
    - 颜文字
    ![颜文字](../assets/rime-scheme-configuration/Kaomoji.webp)

2. TGboard.trime.yaml 初装快速布局调整

    ```yaml
    height: #键盘高度
      1: &pmark 0 #标点符号键盘按键高度punctuation_mark
      2: &pbottom 120 #标点符号键盘底部按键高度punctuation_mark_bottom
      3: &esymbols 0 #表情符号键盘按键高度emoji_symbols
      4: &ebottom 120 #表情符号键盘底部按键高度emoji_bottom
      5: &kaokey 0 #颜文字键盘按键高度kaomoji_key
      6: &kaobottom 120 #颜文字键盘底部按键高度kaomoji_bottom
      7: &ajgd4 100 #主键盘按键
      8: &ajgd5 100 #符号键盘按键
      9: &hgap 8 #键盘横缝大小
      10: &sgap 13 #键盘竖缝大小
      11: &jpbj_sp 350 #竖屏键盘布局高度
      12: &jpbj_hp 250 #横屏键盘布局高度
      13: &ajgd4_4 130 #主键盘尾行按键高度

      14: &ksox_e 17 #字母上方为标点左移距离
      15: &ksoy_c -7 #字母上方为中文-上移距离
      16: &sts_c 11 #字母上方为中文-字体大小

    round_corner: #键盘圆角
      1: &round1 20 #按键圆角半径
      2: &round2 0 #候选窗口圆角
      3: &round3 65 #回车键圆角
    ```

##### 小狼毫-Weasel

1. `weasel.custom.yaml`: 自用主题配色
    - Weasel-NordLight配色
    ![Weasel](../assets/rime-scheme-configuration/Weasel-NordLight.webp)

#### xxx.schema.yaml 方案文件

##### 同文-Trime

- 增广 - 常用
![增广](../assets/rime-scheme-configuration/Augmented.webp)
![常用](../assets/rime-scheme-configuration/Commonly-used.webp)
- 繁体
![繁体](../assets/rime-scheme-configuration/Traditional-Chinese.webp)
- unicode区间显示
![unicode区间显示](../assets/rime-scheme-configuration/Unicode-area-display.webp)

##### 小狼毫-Weasel

- 新世纪五笔等其它方案
    ![Weasel](../assets/rime-scheme-configuration/scheme.webp)

#### xxx.dict.yaml 词典文件

##### 同文-Trime / 小狼毫-Weasel

超大字符集专为输入“生僻字”
含 Unicode 15.1.0 已定义 CJK/CJK-A/CJK-B/CJK-C/CJK-D/CJK-E/CJK-F/CJK-G/CJK-H/CJK-I
我在 https://github.com/CNMan/UnicodeCJK-WuBi06 的基础上添加了最新的 CJK-I
问题可反馈至 https://github.com/CNMan/UnicodeCJK-WuBi06 或 https://github.com/csjtl/UnicodeCJK-WuBi06
