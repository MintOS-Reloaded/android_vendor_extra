# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opa.eligible_device=true

ifeq ($(WITH_GAPPS),true)

GAPPS_VARIANT := nano
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

endif

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay
