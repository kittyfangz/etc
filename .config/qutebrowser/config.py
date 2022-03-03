config.load_autoconfig(False)

config.bind("e", "hint")
config.bind("E", "hint all tab")

config.bind(",t", "spawn --userscript translate")
config.bind(",m", "spawn umpv {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")

c.hints.chars = "aoeuidhtns"

c.downloads.location.directory = "~/rxv"

c.colors.webpage.preferred_color_scheme = "dark"
