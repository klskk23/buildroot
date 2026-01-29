#!/bin/sh
BOARD_DIR="$(dirname "$0")"
install -d "$TARGET_DIR/boot/extlinux/"
DTB_NAME=$(find "$TARGET_DIR/boot/rockchip" -name "*.dtb" | head -n 1 | xargs -n 1 basename)
[[ -z "$DTB_NAME" ]] && echo "DTB name is empty!" && exit 1
sed "s|%FDTFILE%|$DTB_NAME|" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
cp "$BOARD_DIR/genimage.cfg" "$BINARIES_DIR/genimage.cfg"