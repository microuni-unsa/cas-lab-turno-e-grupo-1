# REquirements Manager - Universidad de Sevilla - REMUS

Repository for the Windows binary distribution of _REMUS_ (_REquirements Manager_ - Universidad de Sevilla) for beta testers.

Clone the repository in any directory and execute <code>bin/remus.exe</code>

The executable file and the resource DLLs are relatively stable. Changes will take place mainly in the XSLT stylesheets in the <code>xslt</code> directory and in the documentation project in the <code>doc</code> directory.

## Installation in Linux with WINE (verified with wine-11.0, Win32 prefix)

REMUS is a 32-bit MFC42/DAO 3.6 (Jet 4.0) application — the `.rem` files are Microsoft Access (Jet) databases. A clean Wine prefix crashes with `err:ole:com_get_class_object class {00000100-0000-0010-8000-00AA006D2EA4} not registered` (DAO.DBEngine.36) and `Unhandled page fault on read access to 00000008 at address 00435732`.

Create a **Win32** prefix (many verbs are 32-bit only) and install the required runtime with winetricks:

```sh
# from the repository root (so WINEPREFIX="$(pwd)/.wine" points to ./wine)
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" winecfg   # creates the prefix; set Windows version to e.g. Windows 10 if prompted
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" winetricks -q jet40      # → mdac27 + wsh57 + Jet 4.0 SP8 (dao360.dll, DAO.DBEngine.36)
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" winetricks -q mfc42      # Visual C++ 6 SP4 mfc42 (redundant if you install vcrun6)
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" winetricks -q vcrun6     # mfc42, mfc42u, msvcp60, msvcrt, msvcirt, atl, oleaut32
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" winetricks -q msxml3     # native MSXML3 for XSLT (fixes `bool2space` XPath errors)
```

The original tutorials also suggest `winetricks ie6 gecko msxml3`; with modern Wine the built-in `mshtml`/`ieframe` (Gecko) is sufficient — `msxml3` is the only Browser/XML piece still needed.

Launch:

```sh
WINEARCH=win32 WINEPREFIX="$(pwd)/.wine" wine bin/remus.exe
```

Verified: `wine-11.0` with `jet40`+`vcrun6`+`msxml3` (and `mfc42`/`mdac27`/`wsh57` pulled by `jet40`) launches without page-fault; only benign `fixme:ieframe`/`fixme:mshtml` and `err:ole {6c736db1-bd94-11d0-8a23-00aa00b58e10}` probing remain.

References (in Spanish):

- https://davidjguru.wordpress.com/2010/05/25/rem-wine-y-winetricks/

- https://www.uatek.com/proyecto/2009/07/04/instalacion-de-rem-1-2-2-sobre-wine/

