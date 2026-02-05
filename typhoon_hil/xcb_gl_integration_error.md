# Typhoon HIL crashing in i3 on Ubuntu — Root Cause & Fix

## Symptoms

When opening:

- Model Initialization Script
- SCADA / Widget editor

Typhoon crashed with:

```
Sandboxing disabled by user.
segfault at 0 ip 0x0
```

Everything else in Typhoon worked.

Same Ubuntu + i3 + Typhoon worked on another machine.

---

## What was actually happening

Those two editors are the only parts of Typhoon that use:

> QtQuick + QtWebEngine + OpenGL surfaces

Qt6 on X11 chooses this path by default:

```
XCB → GLX integration → OpenGL context
```

On this machine:

- Mesa/GLVND exposed a GLX implementation
- Qt successfully loaded the GLX integration plugin
- But that GLX path was not actually usable for QtQuick/Chromium
- A NULL function pointer was called inside Qt’s GL layer
- Kernel showed: `segfault at 0`
- Qt misleadingly printed: `Sandboxing disabled by user`

The `dmesg` output for the crash:

```sh
[1218890.947987] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[1218976.072104] typhoon_hil.exe[2754643]: segfault at 0 ip 0000000000000000 sp 00007ffdaf978038 error 14 likely on CPU 0 (core 0, socket 0)
```

This was **not**:
- sandbox
- QtWebEngine
- XCB/XKB
- dbus
- i3
- missing libraries

It was a **Qt6 + Mesa GLX integration incompatibility**.

---

## The Fix

Force Qt to skip GLX and use EGL instead:

```bash
QT_XCB_GL_INTEGRATION=xcb_egl ./typhoon_hil.exe
```

---

## Permanent launcher

```bash
#!/bin/bash
export QT_XCB_GL_INTEGRATION=xcb_egl
exec /opt/typhoon/typhoon_hil_control_center_2025.4/typhoon_hil.exe "$@"
```

---

## Why the other machine worked

On the other machine, the GLX path happened to be compatible with Qt.

Same OS, same i3, same Typhoon — different Mesa/GL behavior.

---

## Key takeaway

If a Qt6 app on X11:

- crashes only in QtQuick / QtWebEngine parts
- shows `Sandboxing disabled by user`
- segfaults at address `0x0`

➡️ Suspect GLX integration and try:

```bash
QT_XCB_GL_INTEGRATION=xcb_egl
```
