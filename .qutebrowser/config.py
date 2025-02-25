# For OSx only
config.unbind('<Ctrl-v>') # passthrough mode
config.unbind('<Ctrl-h>') # go to home
config.unbind('<Ctrl-w>') # accidental tab close while working with vim in split.
config.unbind('d')
config.unbind('u')
config.unbind('r')

config.bind('dd', 'tab-close')
config.bind('uu', 'undo')
config.bind('gT', 'tab-prev')
config.bind('gt', 'tab-focus')
config.bind('gl', 'tab-focus last')
config.bind('cm', 'spawn mpv {url}')
config.bind('sx', 'config-cycle statusbar.hide')
config.bind('b', 'cmd-set-text -s :tab-focus')
config.bind('t', 'cmd-set-text -s :open -t')
config.bind('gm', 'cmd-set-text :tab-move -1')
config.bind('go', 'cmd-set-text -s :open -t gl')
config.bind('<ctrl-r>', 'reload')
config.bind('<ctrl-y>', 'scroll up')
config.bind('<ctrl-e>', 'scroll down')
config.bind('<Ctrl-a>', 'mode-enter insert') # avoid accidental tab refresh or the default select-all.
config.bind('<Ctrl-n>', 'tab-next')
config.bind('<Ctrl-p>', 'tab-prev')
config.bind('<Ctrl-t>', 'cmd-set-text -s :undo')
config.bind('<Ctrl-0>', 'set zoom.default 100%')
config.bind('<Ctrl-=>', 'set zoom.default 150%')
config.bind('O', 'cmd-set-text :open {url:pretty}')
config.bind('T', 'cmd-set-text :open -t {url:pretty}')

config.bind('<Ctrl-w>', 'rl-backward-kill-word', mode='command')
config.bind('<Ctrl-i>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-o>', 'completion-item-focus prev', mode='command')

config.bind('<Ctrl-s>', 'edit-text', mode='insert')
config.bind('<Ctrl-i>', 'fake-key <Tab>', mode='insert')
config.bind('<Ctrl-o>', 'fake-key <Shift-Tab>', mode='insert')
config.bind('<Ctrl-h>', 'fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-m>', 'fake-key <Enter>', mode='insert')
# Emacs in INSERT mode.
config.bind('<Ctrl-p>', 'fake-key <Up>', mode='insert')
config.bind('<Ctrl-n>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-e>', 'fake-key <Command-Right>', mode='insert')
config.bind('<Ctrl-a>', 'fake-key <Command-Left>', mode='insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-f>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-y>', 'insert-text {primary}', mode='insert')
config.bind('<Ctrl-u>', 'fake-key <Ctrl-Shift-Left> ;; fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-w>', 'fake-key <Shift-Alt-Left> ;; fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-v>', 'insert-text -- {clipboard}', mode='insert')
config.bind('<Ctrl-Shift-v>', 'insert-text -- {clipboard}', mode='insert')
#  config.bind('<Ctrl-v>', 'command-paste', mode='command')
config.bind('<Ctrl-c>', 'yank selection', mode='insert')
config.bind('<Ctrl-c>', 'yank selection', mode='caret')
config.load_autoconfig(False)

c.statusbar.padding = { "bottom": 0, "left": 0, "right": 0, "top": 0 }
c.statusbar.widgets = ["url", "scroll", "tabs", "progress"]
c.scrolling.bar = 'never'
c.auto_save.session = True
c.session.lazy_restore = True
#  c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36'

c.tabs.width = 19
c.tabs.position = 'left'
c.tabs.indicator.width = 0
c.tabs.background = True
c.tabs.select_on_remove = 'prev'
c.tabs.new_position.related = 'last'
c.content.notifications.enabled = False
c.window.hide_decoration = True
c.completion.web_history.exclude = [
  'https://*/login*',
  'https://*/servicedesk/customer/portal/6/user/login*',
  'https://*.okta.com/app/*',
  'https://*/SAML2/POST*',
  'https://login.microsoftonline.com/*',
  'https://www.google.co.in/search*',
  'https://www.thesaurus.com/*',
  'https://www.w3schools.com/*',
  'https://*.atlassian.net/wiki/spaces/*/pages/edit*',
]

c.aliases = {
    'cs': 'config-source',
    'cls': 'clear-messages',
    'tt': 'tab-move',
}

search_engine_path = 'https://www.google.co.in/search?q='
c.url.searchengines = {
    'DEFAULT': search_engine_path + '{}',
    'cb': search_engine_path + 'qutebrowser {}',
    'st': search_engine_path + 'stackexchange {}',
    'kt': search_engine_path + 'site:reddit.com/r/keto {}',
    'g': search_engine_path + '{}',
    'en': 'https://www.openhub.net/p/{}/enlistments?sort=update_status',
    'ac': 'https://www.openhub.net/accounts/{}',
    'gi': 'http://images.google.com/images?q={}',
    'gl': 'https://www.google.com/search?btnI=I%27m+Feeling+Lucky&q={}',
    'maps': 'https://maps.google.co.in/maps?q={}',
    'news': 'https://www.google.co.in/search?tbm=nws&q={}',
    'news-sorted': 'https://www.google.co.in/search?tbm=nws&tbs=sbd:1&q={}',
    'rubygems-search': 'http://rubygems.org/gems/{}',
    'npm-search': 'https://www.npmjs.com/package/{}',
    'github-search': 'https://github.com/search?q={}',
    'stack-overflow': 'http://stackoverflow.com/search?q={}',
    'wikipedia': 'http://en.wikipedia.org/wiki/{}',
    'thesaurus': 'http://thesaurus.com/browse/{}',
    'yt': 'http://www.youtube.com/results?search_query={}',
    'youtube-recent': 'http://www.youtube.com/results?search_sort=video_date_uploaded&search_query={}',
    'dailymotion': 'http://www.dailymotion.com/in/relevance/search/{}',
    'flipkart': 'http://www.flipkart.com/search?p%5B%5D=sort%3Dpopularity&q={}',
    'kindle': 'http://www.amazon.in/s/url=search-alias%3Ddigital-text&field-keywords={}',
    'aliexpress': 'https://www.aliexpress.com/wholesale?SearchText={}',
    'am': 'https://www.amazon.in/s?k={}',
    'amo': 'https://www.amazon.in/gp/your-account/order-history?search={}',
    'bb': 'https://www.bigbasket.com/ps/?nc=as&q={}',
    'dk': 'https://www.dekudeals.com/search?q={}',
}

c.content.javascript.log_message.excludes = {"userscript:_qute_stylesheet": ["*Refused to apply inline style because it violates the following Content Security Policy directive: *"],
                                             "userscript:_qute_js": ["*TrustedHTML*"]}
