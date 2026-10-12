# Macan graphics bring-up

EGL/GLES, mapper, allocator and Gen8 firmware files come from the supplied
macan Android 16 dump. No proprietary graphics libraries are copied from another
device or patched to depend on versioned libc++ shims.

`msm_kgsl.ko` is loaded from installed firmware with AERA's dependency-aware
module loader. No kernel modules are bundled here. The AERA GPU probe source is
reused from the existing device integrations; it is not a vendor blob.

Hardware rendering and fastbootd transitions still require testing on macan.
