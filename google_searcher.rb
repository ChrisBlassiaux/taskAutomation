require 'launchy'

def get_argv
  search = ARGV
  abort("Error: enter your search after the 'search' command") if ARGV.empty?
  return search
end

def build_url(sch)
  url = "https://www.google.com/search?q=" + sch.join('+')
  return url
end

def open_url(url)
  Launchy.open(url)
end

open_url(build_url(get_argv))