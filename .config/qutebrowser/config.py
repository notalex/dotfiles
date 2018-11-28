config.unbind('<Ctrl-v>') # passthrough mode
config.unbind('<Ctrl-h>') # go to home
config.unbind('d')
config.unbind('u')

config.bind('dd', 'tab-close')
config.bind('uu', 'undo')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('<ctrl-e>', 'scroll down')
config.bind('<ctrl-y>', 'scroll up')
config.bind('sx', 'config-cycle statusbar.hide')
config.bind('<Ctrl-n>', 'tab-next')
config.bind('<Ctrl-p>', 'tab-prev')
config.bind('gt', 'tab-focus')
config.bind('gT', 'tab-prev')
config.bind('gl', 'tab-focus last')
config.bind('b', 'set-cmd-text -s :buffer')
config.bind('<Ctrl-o>', 'set-cmd-text :open {url:pretty}')

config.bind('<Ctrl-i>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-o>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-w>', 'rl-backward-kill-word', mode='command')

config.bind('<Ctrl-s>', 'open-editor', mode='insert')
config.bind('<Ctrl-h>', 'fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-i>', 'fake-key <Tab>', mode='insert')
config.bind('<Ctrl-o>', 'fake-key <Shift-Tab>', mode='insert')
config.bind('<Ctrl-m>', 'fake-key <Enter>', mode='insert')
# Emacs in INSERT mode.
config.bind('<Ctrl-a>', 'fake-key <Home>', mode='insert')
config.bind('<Ctrl-e>', 'fake-key <End>', mode='insert')
config.bind('<Ctrl-f>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-u>', 'fake-key <Shift+Home> ;; fake-key <Delete>', mode='insert')
config.bind('<Ctrl-y>', 'insert-text {primary}', mode='insert')

c.auto_save.session = True
c.statusbar.hide = True
c.tabs.background = True
c.tabs.position = 'left'
c.tabs.select_on_remove = 'last-used'
c.tabs.width = '1%'
c.tabs.indicator.width = 0
c.scrolling.bar = 'never'
c.tabs.new_position.related = 'last'

c.aliases = {
    'cs': 'config-source',
}

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'g': 'https://www.google.co.in/search?q={}',
    'cb': 'https://duckduckgo.com/?q=qutebrowser {}',
    'gi': 'http://images.google.com/images?q={}',
    'gl': 'https://www.google.com/search?btnI=I%27m+Feeling+Lucky&q={}',
    'maps': 'https://maps.google.co.in/maps?q={}',
    'news': 'https://www.google.co.in/search?tbm=nws&q={}',
    'news-sorted': 'https://www.google.co.in/search?tbm=nws&tbs=sbd:1&q={}',
    'rubygems': 'http://rubygems.org/gems/{}',
    'github': 'https://github.com/search?q={}',
    'stack-overflow': 'http://stackoverflow.com/search?q={}',
    'wikipedia': 'http://en.wikipedia.org/wiki/{}',
    'thesaurus': 'http://thesaurus.com/browse/{}',
    'yt': 'http://www.youtube.com/results?search_query={}',
    'youtube-recent': 'http://www.youtube.com/results?search_sort=video_date_uploaded&search_query={}',
    'dailymotion': 'http://www.dailymotion.com/in/relevance/search/{}',
    'flipkart': 'http://www.flipkart.com/search?p%5B%5D=sort%3Dpopularity&q={}',
    'kindle': 'http://www.amazon.in/s/url=search-alias%3Ddigital-text&field-keywords={}',
    'aliexpress': 'https://www.aliexpress.com/wholesale?SearchText={}',
    'am': 'http://www.amazon.in/s/field-keywords={}',
    'bb': 'https://www.bigbasket.com/ps/?nc=as&q={}',
}
