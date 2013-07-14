#
# This is the product configuration for a full edison
#
$(call inherit-product, device/motorola/omap4-common/common.mk)

DEVICE_FOLDER := device/motorola/edison

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/motorola/edison/overlay

# Hardware HALs
PRODUCT_PACKAGES += \
    power.edison \
    camera.edison \
    lights.edison \
    hwcomposer.edison

# Modem
PRODUCT_PACKAGES += \
    Stk

# Extras
PRODUCT_PACKAGES += \
    openssl

# Kexec rootfs files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/init.mapphone.rc:root/init.mapphone_umts.rc \
    $(DEVICE_FOLDER)/root/init.mapphone.rc:root/init.mapphone_cdma.rc \
    $(DEVICE_FOLDER)/root/init.target.rc:root/init.target.rc \
    $(DEVICE_FOLDER)/root/init.rc:root/init.rc \
    $(DEVICE_FOLDER)/root/init:root/init \
    $(DEVICE_FOLDER)/root/ueventd.rc:root/ueventd.rc \
    $(DEVICE_FOLDER)/kexec/devtree:system/etc/kexec/devtree \
    $(OUT)/ramdisk.img:system/etc/kexec/ramdisk.img \
    $(OUT)/kernel:system/etc/kexec/kernel

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/vold.fstab:system/etc/vold.fstab

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/edison/edison-vendor.mk)
$(call inherit-product-if-exists, vendor/motorola/edison/edison-vendor-stock-camera.mk)
$(call inherit-product-if-exists, vendor/motorola/edison/edison-vendor-stock-ducati.mk)
$(call inherit-product-if-exists, vendor/motorola/omap4-common/common-vendor-pvr.mk)

