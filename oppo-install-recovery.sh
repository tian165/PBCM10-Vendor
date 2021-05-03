#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:39875864:f764fe03c3b062997035c0308e995c2ae4e55bfc; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:13542676:6ef5772b994c7e700985d3d3e9fee62dbdbb6f8e \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:39875864:f764fe03c3b062997035c0308e995c2ae4e55bfc && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
