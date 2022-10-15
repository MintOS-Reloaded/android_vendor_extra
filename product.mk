# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

ifneq ($(TARGET_GAPPS_ARCH),arm)
ifneq ($(TARGET_GAPPS_ARCH),arm64)
$(error "GAPPS: Only arm and arm64 are allowed")
$(error "Has to be defined in vanilla builds as well")
endif
endif

include vendor/extra/${TARGET_ARCH}.mk

PRODUCT_PACKAGES += \
    com.google.android.maps

ifeq ($(IS_PHONE),true)
PRODUCT_PACKAGES += \
    com.google.android.dialer.support
endif

$(call inherit-product, vendor/gapps/common-blobs.mk)

ifeq ($(TARGET_INCLUDE_STOCK_ARCORE),true)
PRODUCT_PACKAGES += \
    arcore
endif

# System app
PRODUCT_PACKAGES += \
    GoogleExtShared \
    GooglePrintRecommendationService

# System priv-app
PRODUCT_PACKAGES += \
    GoogleExtServicesPrebuilt

# Product app
PRODUCT_PACKAGES += \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    MarkupGoogle \
    SoundPickerPrebuilt \
    talkback \
    WebViewGoogle

# Product priv-app
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    CarrierServices \
    ConfigUpdater \
    ConnMetrics \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleServicesFramework \
    Phonesky \
    PrebuiltGmsCoreQt \
    SetupWizardPrebuilt \
    TurboPrebuilt \
    Velvet \
    WallpaperPickerGoogleRelease \
    WellbeingPrebuilt

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=true

PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/MintOS-Revived/ota_config/raw/Mint2_g/{device}.json
else
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/MintOS-Revived/ota_config/raw/Mint2/{device}.json
endif
