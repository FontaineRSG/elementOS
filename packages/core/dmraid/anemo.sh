post_upgrade() {
  if [ "$(vercmp $2 1.0.0.rc15)" -lt 0 ]; then
    # important upgrade notice
    echo ">>>"
    echo ">>> IMPORTANT DMRAID UPGRADE NOTICE"
    echo ">>> -------------------------------"
    echo ">>> Version 1.0.0.rc15 and greater introduce a new name scheme:"
    echo ">>> You need to add an additional 'p' in front of your number."
    echo ">>> e.g. <yourname><number> --> <yourname>p<number>"
    echo ">>>      firsthd1           --> firsthdp1"
    echo ">>> Please change your bootloader and fstab accordingly."
    echo ">>>"
  fi
}


