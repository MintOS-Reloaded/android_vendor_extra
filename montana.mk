# ARCore
TARGET_INCLUDE_STOCK_ARCORE := true

PRODUCT_COPY_FILES += \
    vendor/extra/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=true

# GApps
TARGET_GAPPS_ARCH := arm64
