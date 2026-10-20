
let carapace_completer = {|place|
  carapace $place.command.0  nushell ...$place.command | from json
}


$env.config = {
  show_banner: false,
  completions: {
    case_sensitive: false # case-sensitive completions
    quick: true    # set to false to prevent auto-selecting completions
    partial: true    # set to false to prevent partial filling of the prompt
    algorithm: "fuzzy"    # prefix or fuzzy
    external: {
      # set to false to prevent nushell looking into $env.PATH to find more suggestions
      enable: true 
      # set to lower can improve completion performance at the cost of omitting some options
      max_results: 100 
      completer: $carapace_completer # check 'carapace_completer' 
    }
  }
} 
$env.EDITOR = "hx"
# $env.PATH = ($env.PATH | 
#   split row (char esep) |
#   prepend /home/myuser/.apps |
#   append /usr/bin/env
# )

def ll [--all(-a), ...pattern]  {
  let pattern = if ($pattern | is-empty) { '.' } else { $pattern | str join " " }
  if $all  {
    ls -la $pattern | select name mode user group size
  } else {
    ls -l $pattern | select name mode user group size
  }
}

def --wrapped zzip [...args] {
    ^zip ...$args
}


def --wrapped "nix develop" [...args] {
  # If you already passed -c/--command (or something like --print-dev-env), don't add nu
  if ($args | any {|a| $a in ["-c" "--command" "--print-dev-env"] }) {
    ^nix develop ...$args
  } else {
    ^nix develop ...$args --command nu
  }
}
