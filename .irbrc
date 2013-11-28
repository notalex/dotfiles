IRB.conf[:PROMPT][:MY_PROMPT] = {
  PROMPT_I: "%02n/: ",
  PROMPT_S: "<<: ",
  PROMPT_C: "%02i> ",
  PROMPT_N: "%02i> ",
  RETURN: "__\n=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT
