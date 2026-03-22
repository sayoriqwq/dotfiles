function zen
    # 一个微小、隐藏的禅意彩蛋 (Easter Egg)
    set quote_mode --online
    if contains -- --local $argv
        set quote_mode --local
    end

    set quote (__sayori_zen_quote $quote_mode)

    echo ""
    # 使用辅助强调色 (意图为点缀，如我们的薰衣草紫)
    if test -n "$quote"
        set_color $fish_color_keyword
        echo "  $quote"
        set_color normal
    end
    echo ""
end
