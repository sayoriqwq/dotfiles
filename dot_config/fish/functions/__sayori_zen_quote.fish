function __sayori_zen_quote --description "Return a zen quote with hitokoto cache fallback"
    set mode auto
    if contains -- --local $argv
        set mode local
    else if contains -- --online $argv
        set mode online
    end

    set local_quotes \
        "当你的杯子空了，才能装入新的茶水。" \
        "应无所住，而生其心。" \
        "少即是多。" \
        "水静极则形象明，心静极则智慧生。" \
        "不要去追马，用追马的时间种草。" \
        "步履不停，但心无挂碍。" \
        "风过竹不留声，雁渡寒潭不见影。" \
        "山高自有客行路，水深自有渡船人。" \
        "心若不动，风又奈何。" \
        "忙处有静气，乱中见初心。" \
        "把目光收回来，先照见自己。" \
        "见山是山，见水是水。" \
        "竹影扫阶尘不动，月轮穿沼水无痕。" \
        "把今天过好，便是对光阴最深的敬意。" \
        "静能生定，定能生慧。" \
        "花未全开月未圆，恰是人间好时节。" \
        "知足不辱，知止不殆。" \
        "行到水穷处，坐看云起时。"

    set rand_index (math (random)"%"(count $local_quotes) + 1)
    set local_quote $local_quotes[$rand_index]

    if test "$mode" = local
        echo $local_quote
        return 0
    end

    set cache_home ~/.cache
    if set -q XDG_CACHE_HOME
        set cache_home $XDG_CACHE_HOME
    end

    set cache_dir $cache_home/sayori
    set cache_file $cache_dir/hitokoto.txt
    set cache_ttl 21600
    set now (date +%s)
    set cached_quote ""

    if test -f $cache_file
        set cached_quote (string trim -- (cat $cache_file))
        set cache_mtime (command stat -f %m $cache_file 2>/dev/null)
        if test -n "$cache_mtime"
            set cache_age (math "$now - $cache_mtime")
            if test $cache_age -lt $cache_ttl -a -n "$cached_quote"
                echo $cached_quote
                return 0
            end
        end
    end

    if command -sq curl
        set fetched_quote (curl -fsSL --connect-timeout 0.5 --max-time 1 \
            'https://v1.hitokoto.cn/?encode=text&c=i&c=k&c=d&max_length=28' 2>/dev/null \
            | string replace -a \n ' ' \
            | string trim)

        if test -n "$fetched_quote"
            command mkdir -p $cache_dir 2>/dev/null
            printf '%s\n' "$fetched_quote" > $cache_file
            echo $fetched_quote
            return 0
        end
    end

    if test -n "$cached_quote"
        echo $cached_quote
        return 0
    end

    echo $local_quote
end
