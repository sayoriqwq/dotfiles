function zen
    # 一个微小、隐藏的禅意彩蛋 (Easter Egg)
    set quotes \
        "当你的杯子空了，才能装入新的茶水。" \
        "应无所住，而生其心。" \
        "少即是多。" \
        "水静极则形象明，心静极则智慧生。" \
        "不要去追马，用追马的时间种草。" \
        "步履不停，但心无挂碍。"

    # 随机选择一句
    set rand_index (math (random)"%"(count $quotes) + 1)
    set quote $quotes[$rand_index]

    echo ""
    # 使用辅助强调色 (意图为点缀，如我们的薰衣草紫)
    set_color $fish_color_keyword
    echo "  $quote"
    set_color normal
    echo ""
end