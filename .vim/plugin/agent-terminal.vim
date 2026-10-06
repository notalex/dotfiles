if exists('g:loaded_agent_terminal')
  finish
endif
let g:loaded_agent_terminal = 1

let s:agent = empty($DEFAULT_AGENT) ? 'crush' : $DEFAULT_AGENT
command! AgentTerminal tabnew | execute 'terminal ' . s:agent | startinsert
command! AgentTerminalNew tabnew | execute 'terminal' | startinsert
