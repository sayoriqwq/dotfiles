function __sayori_zen_quote --description "Return a hitokoto quote with local cache pool fallback"
    set mode auto
    if contains -- --local $argv
        set mode local
    else if contains -- --online $argv
        set mode online
    end

    set cache_home ~/.cache
    if set -q XDG_CACHE_HOME
        set cache_home $XDG_CACHE_HOME
    end

    set cache_dir $cache_home/sayori
    set cache_file $cache_dir/hitokoto.txt
    set cache_pool_file $cache_dir/hitokoto_pool.txt
    set cache_ttl 21600
    set cache_pool_limit 120
    set now (date +%s)
    set cached_quote ""
    set cached_pool_quotes

    if test -f $cache_file
        set cached_quote (string trim -- (cat $cache_file))
    end

    if test -f $cache_pool_file
        for cached_line in (cat $cache_pool_file)
            set trimmed_line (string trim -- $cached_line)
            if test -n "$trimmed_line"
                set cached_pool_quotes $cached_pool_quotes $trimmed_line
            end
        end
    end

    if test "$mode" = local
        if test (count $cached_pool_quotes) -gt 0
            set rand_index (math (random)"%"(count $cached_pool_quotes) + 1)
            echo $cached_pool_quotes[$rand_index]
            return 0
        end

        if test -n "$cached_quote"
            echo $cached_quote
            return 0
        end

        return 1
    end

    if test -n "$cached_quote"
        set cache_mtime (command stat -f %m $cache_file 2>/dev/null)
        if test -n "$cache_mtime"
            set cache_age (math "$now - $cache_mtime")
            if test $cache_age -lt $cache_ttl
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

            set updated_pool_quotes $cached_pool_quotes
            set quote_exists 0
            for existing_quote in $updated_pool_quotes
                if test "$existing_quote" = "$fetched_quote"
                    set quote_exists 1
                    break
                end
            end

            if test $quote_exists -eq 0
                set updated_pool_quotes $updated_pool_quotes $fetched_quote
            end

            if test (count $updated_pool_quotes) -gt $cache_pool_limit
                set start_index (math (count $updated_pool_quotes) - $cache_pool_limit + 1)
                set updated_pool_quotes $updated_pool_quotes[$start_index..-1]
            end

            if test (count $updated_pool_quotes) -gt 0
                printf '%s\n' $updated_pool_quotes > $cache_pool_file
            end

            echo $fetched_quote
            return 0
        end
    end

    if test -n "$cached_quote"
        echo $cached_quote
        return 0
    end

    if test (count $cached_pool_quotes) -gt 0
        set rand_index (math (random)"%"(count $cached_pool_quotes) + 1)
        echo $cached_pool_quotes[$rand_index]
        return 0
    end

    return 1
end
