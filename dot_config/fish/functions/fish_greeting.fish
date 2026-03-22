function fish_greeting
    # 获取当前小时 (0-23)
    set hour (date +%H)

    # 极简、禅意的上下文问候语
    if test $hour -ge 5 -a $hour -lt 12
        set greetings \
            "早安。保持专注。" \
            "早安。先把心放稳，再把事做好。" \
            "晨光正好，慢一点，准一点。" \
            "新的一段时辰，先照顾好呼吸。"
    else if test $hour -ge 12 -a $hour -lt 18
        set greetings \
            "午安。内心平静。" \
            "日色正盛，心里仍可留白。" \
            "午后不必急，稳稳推进就好。" \
            "事有轻重，心无杂沓。"
    else if test $hour -ge 18 -a $hour -lt 23
        set greetings \
            "晚安。整理思绪。" \
            "把白日收拢，给夜色一点安静。" \
            "夜幕将落，心也该慢下来。" \
            "此刻适合收束，也适合沉淀。"
    else
        set greetings \
            "夜深了。适时休息。" \
            "万物渐静，别让心继续奔波。" \
            "夜色已深，把清醒留给明天。" \
            "此时最宜放下，不宜再执着。"
    end

    set greeting_index (math (random)"%"(count $greetings) + 1)
    set greeting $greetings[$greeting_index]
    set quote (__sayori_zen_quote --online)

    # 使用退后文本色（最不打扰的颜色）输出，符合禅意不喧宾夺主的原则
    set_color $fish_color_comment
    # 前面加两个空格，留出呼吸感
    echo "  $greeting"
    if test -n "$quote"
        echo "  $quote"
    end
    set_color normal

    # 额外留出一个空行，与随后的提示符隔开
    echo ""
end
