# AERA device tree — OnePlus 15R / Ace 6T (macan)

Based on the working OrangeFox tree by Jonas Salo and Daniel Springer.
Original commit history and licensing are retained.

## Bring-up status

The first AERA test build compiles successfully, but has not been tested on macan.
Display, touch, decryption, flashing and storage worked with the original
OrangeFox build; that is not yet confirmation for AERA.

- AERA adaptive UI, English default, native Root Manager, FRP wipe and the
  optional Keep current ABL setting configured.
- Partition geometry and model aliases retained; obsolete system_dlkm_oki build
  entries removed for the Android 16 build system.
- Vibration was broken upstream. The AIDL backend remains selected; runtime
  diagnosis and firmware dependency checks are still required.
- Device-specific ELF blobs replaced from the macan Android 16 dump, including
  Rust Gatekeeper and `hlosminkdaemon`. Legacy
  versioned libc++ and keystore overrides removed.
- Adreno graphics and the post-decryption AGM/PAL audio integration added.
- WCN7750 Wi-Fi uses ICNSS/WPSS with post-decryption module loading. AERA supplies
  the supplicant and DHCP tools; no duplicate executables are bundled.
- Kernel modules load from installed firmware rather than the recovery ramdisk.
  Audio calibration and runtime libraries use read-only installed partitions.

Test boot, decryption, touch, vibration, Wi-Fi, audio, GPU rendering and fastbootd
transitions before relying on this build. Build success is not hardware validation.

## Build

With the AERA aera-16.0 source synced and this tree at
device/oneplus/macan, use a fresh shell:

```sh
source build/envsetup.sh
source device/oneplus/macan/vendorsetup.sh macan
lunch twrp_macan-bp2a-eng
mka recoveryimage
```

When switching devices, clean/clobber the previous output before building.
The explicit vendorsetup selection prevents this tree from overriding another
device merely because envsetup discovers it. Other trees may still have their
own unguarded setup scripts.

Build labels follow the project's Official/Beta configuration; this does not
imply that this untested port has been released.
