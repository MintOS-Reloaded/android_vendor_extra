BOARD_SEPOLICY_DIRS += vendor/extra/sepolicy

PRODUCT_PACKAGES += //vendor/extra:LineageFpg

# Init
TARGET_INIT_VENDOR_LIB := //vendor/extra:libinit_mint
TARGET_RECOVERY_DEVICE_MODULES := //vendor/extra:libinit_mint
