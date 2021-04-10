# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

include vendor/extra/${device}.mk

ifeq (${WITH_GAPPS},true)
ifeq ($(TARGET_GAPPS_ARCH),)
$(error "GAPPS: TARGET_GAPPS_ARCH is undefined")
endif

ifneq ($(TARGET_GAPPS_ARCH),arm)
ifneq ($(TARGET_GAPPS_ARCH),arm64)
$(error "GAPPS: Only arm and arm64 are allowed")
endif
endif

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


PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/gapps_se_{device}.json
else
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/se_{device}.json
endif
