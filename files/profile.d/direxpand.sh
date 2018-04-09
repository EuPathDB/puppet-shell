if `shopt -p | grep -q direxpand`; then
  # EBRC does not normally globally change OS default behavior but the
  # removal of tab expansion of dir variables in bash 4.2 is unexpected
  # and considered to be a bug.
  # See also
  # http://stackoverflow.com/questions/6418493/bash-variable-expansion-on-tab-complete
  shopt -s direxpand
fi
