# ARCore
TARGET_INCLUDE_STOCK_ARCORE := true

PRODUCT_COPY_FILES += \
    vendor/extra/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml

# GApps
TARGET_GAPPS_ARCH := arm64

# Swipelibs
PRODUCT_COPY_FILES += \
    vendor/extra/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libjni_latinimegoogle.so
