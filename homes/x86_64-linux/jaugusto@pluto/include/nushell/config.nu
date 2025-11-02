$env.config.show_banner = false
$env.config.use_kitty_protocol = true;

$env.config.history.file_format = "sqlite"
$env.config.history.isolation = false

$env.config.completions.algorithm = "fuzzy" 
$env.config.completions.sort = "smart"
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.use_ls_colors = true

alias flakeup = nix flake update --flake $env.NH_FLAKE
alias build-iso = nom build $"($env.NH_FLAKE)#install-isoConfigurations.terra"
alias check-flake = nix repl --expr $"builtins.getFlake \(builtins.toString ($env.NH_FLAKE))"
alias nos = nh os switch
alias nca = nh clean all --keep 5

