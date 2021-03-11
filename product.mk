# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

# Swipelibs
PRODUCT_COPY_FILES += \
    vendor/extra/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libjni_latinimegoogle.so

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

include vendor/extra/${device}.mk

TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

ifeq (${WITH_GAPPS},true)
$(call inherit-product, vendor/gapps/config.mk)
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/gapps_{device}.json
else
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/{device}.json
endif
