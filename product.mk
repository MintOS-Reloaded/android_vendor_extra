# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

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

$(call inherit-product, vendor/gapps/product/blobs/product_blobs.mk)
$(call inherit-product, vendor/gapps/system/blobs/system_blobs.mk)
$(call inherit-product, vendor/gapps/system_ext/blobs/system-ext_blobs.mk)


ifeq ($(TARGET_INCLUDE_STOCK_ARCORE),true)
PRODUCT_PACKAGES += \
    arcore
endif

PRODUCT_PACKAGES += \
    MicropaperPrebuilt \
    WallpapersBReel2020 \
    PixelLiveWallpaperPrebuilt \
    PixelWallpapers2020

# product/app
PRODUCT_PACKAGES += \
    CarrierMetrics \
    GoogleTTS \
    GoogleContactsSyncAdapter \
    MarkupGoogle \
    PixelThemesStub \
    PrebuiltBugle \
    SoundAmplifierPrebuilt \
    SoundPickerPrebuilt \
    TrichromeLibrary \
    TrichromeLibrary-Stub \
    Tycho

# product/priv-app
PRODUCT_PACKAGES += \
    AndroidAutoStubPrebuilt \
    AndroidMigratePrebuilt \
    AppDirectedSMSService \
    CarrierLocation \
    CarrierServices \
    CarrierWifi \
    ConfigUpdater \
    DCMO \
    ConnMO \
    ConnMetrics \
    DMService \
    GoogleOneTimeInitializer \
    DevicePersonalizationPrebuiltPixel2020 \
    PartnerSetupPrebuilt \
    Phonesky \
    SCONE \
    SafetyHubPrebuilt \
    ScribePrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    SetupWizardPrebuilt \
    TetheringEntitlement \
    TurboPrebuilt \
    Velvet \
    WellbeingPrebuilt \
    WfcActivation

# system/app
PRODUCT_PACKAGES += \
    CaptivePortalLoginGoogle \
    GoogleExtShared \
    GooglePrintRecommendationService

# system/priv-app
PRODUCT_PACKAGES += \
    GooglePackageInstaller \
    TagGoogle

# system_ext/app
PRODUCT_PACKAGES += \
    Flipendo

# system_ext/priv-app
PRODUCT_PACKAGES += \
    CarrierSetup \
    CbrsNetworkMonitor \
    GoogleOneTimeInitializer \
    GoogleServicesFramework \
    grilservice \
    RilConfigService \
    StorageManagerGoogle

# PrebuiltGmsCore
PRODUCT_PACKAGES += \
    PrebuiltGmsCoreRvc \
    PrebuiltGmsCoreRvc_AdsDynamite \
    PrebuiltGmsCoreRvc_CronetDynamite \
    PrebuiltGmsCoreRvc_DynamiteLoader \
    PrebuiltGmsCoreRvc_DynamiteModulesA \
    PrebuiltGmsCoreRvc_DynamiteModulesC \
    PrebuiltGmsCoreRvc_GoogleCertificates \
    PrebuiltGmsCoreRvc_MapsDynamite \
    PrebuiltGmsCoreRvc_MeasurementDynamite \
    AndroidPlatformServices

PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/gapps_{device}.json
else
PRODUCT_PROPERTY_OVERRIDES += lineage.updater.uri=https://github.com/nift4/Mint-OS/raw/ota/{device}.json
endif
