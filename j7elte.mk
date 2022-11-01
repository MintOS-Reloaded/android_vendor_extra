# GApps
TARGET_GAPPS_ARCH := arm

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=true
