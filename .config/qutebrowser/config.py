config.load_autoconfig(False)

config.bind("e", "hint")
config.bind("E", "hint all tab")
config.bind("!", "set-cmd-text :open !")

config.bind(",t", "spawn --userscript translate")
config.bind(",m", "spawn umpv {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")
config.bind(",d", 'spawn -m yt-dlp {url} -f "bv*+ba" --embed-metadata --embed-subs --embed-chapters --embed-thumbnail --merge-output-format mkv -P "~/rxv/vid" -o "%(channel)s/%(upload_date)s-%(title)s.%(ext)s"')
config.bind(",D", 'spawn -m yt-dlp {url} -f "ba" -x --embed-metadata --embed-thumbnail --merge-output-format aac -P "~/rxv/vid" -o "%(channel)s/%(upload_date)s-%(title)s.%(ext)s"')

#collect file and put in the Correct location
config.bind(",ci", "hint images run download --dest '~/rxv/img/' {hint-url}")
config.bind(",cf", "hint links run download --dest '~/rxv/fla/' {hint-url}")
config.bind(",ct", "hint links run download --dest '~/rxv/txt/' {hint-url}")

#open in a program
config.bind(",oe", "download-open alacritty --class editor -o window.dimensions.columns=80 -o window.dimensions.lines=24 -e nvim {}")
config.bind(",of", "download-open flashplayer {}")
config.bind(",oi", "download-open feh {}")
config.bind(",om", "download-open mpv {}")
config.bind(",or", "hint links spawn alacritty --class editor -o window.dimensions.columns=80 -o window.dimensions.lines=24 -e nvim {hint-url}")

config.bind("wa", "open https://web.archive.org/web/{url}")
config.bind("wA", "open -t https://web.archive.org/web/{hint-url}")

c.hints.chars = "aoeuhtns"

c.downloads.location.directory = "~/rxv"

c.colors.webpage.preferred_color_scheme = "dark"
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
        "https://easylist.to/easylist/easylist.txt",
        "https://easylist.to/easylist/easyprivacy.txt",
        "https://easylist.to/easylist/fanboy-social.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
        "https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter-online.txt",
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext",
        "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
        "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt",
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
        "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
        "https://www.i-dont-care-about-cookies.eu/abp/"
    ]
c.content.pdfjs = True
c.content.autoplay = False
c.content.javascript.can_access_clipboard = True
c.auto_save.session = True

c.editor.command = ["alacritty", "--class", "editor", "-o", "window.dimensions.columns=80", "-o", "window.dimensions.lines=24", "-o", "window.position.x=50", "-o", "window.position.y=50", "-e", "nvim", "-f", "{}"]
