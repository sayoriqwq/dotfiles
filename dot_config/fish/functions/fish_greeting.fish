function fish_greeting
    # 获取当前小时 (0-23)
    set hour (date +%H)
    
    # 极简、禅意的上下文问候语
    set greeting ""
    if test $hour -ge 5 -a $hour -lt 12
        set greeting "早安。保持专注。"
    else if test $hour -ge 12 -a $hour -lt 18
        set greeting "午安。内心平静。"
    else if test $hour -ge 18 -a $hour -lt 23
        set greeting "晚安。整理思绪。"
    else
        set greeting "夜深了。适时休息。"
    end

    # 使用退后文本色（最不打扰的颜色）输出，符合禅意不喧宾夺主的原则
    set_color $fish_color_comment
    # 前面加两个空格，留出呼吸感
    echo "  $greeting"
    set_color normal
    
    # 额外留出一个空行，与随后的提示符隔开
    echo ""
end