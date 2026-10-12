# Guía de Ejecución de TortoiseSVN con Wine / NixOS

Esta guía resume los problemas comunes y la forma correcta de instalar y utilizar **TortoiseSVN (64-bit)** bajo Wine en Linux / NixOS con un WINEPREFIX local (`./.wine`).

---

## 1. Requisitos de Arquitectura (64-bit)

El instalador `TortoiseSVN-1.14.9.29743-x64-svn-1.14.5.msi` es un binario de **64 bits**.
- En NixOS, el paquete estándar `pkgs.wine` suele ser de 32 bits (`i386`), lo que causará el error `ERROR_INSTALL_PLATFORM_UNSUPPORTED` (código de salida `97`).
- Debe utilizarse **`wineWow64Packages.stable`** (o `wine64`).

Ejecución temporal con Nix:
```bash
nix shell nixpkgs#wineWow64Packages.stable
```

---

## 2. Instalación del MSI

### Error Común: *Windows 10 version 1607 or later*
El instalador contiene una condición de verificación (`LaunchConditions` -> `searchFileWin10`) que revisa la versión de `user32.dll`. Para saltarse este bloqueo en Wine, se pasa la propiedad `WIN10_1607_FOUND=1`.

### Comando de Instalación:
```bash
nix shell nixpkgs#wineWow64Packages.stable -c bash -c '
  WINEPREFIX="$PWD/.wine" wine msiexec /i TortoiseSVN-1.14.9.29743-x64-svn-1.14.5.msi WIN10_1607_FOUND=1
'
```

---

## 3. Cómo Usar TortoiseSVN en Wine

En Windows, TortoiseSVN se integra al explorador mediante extensiones de shell (menú contextual). En Wine / Linux, dicha integración no existe con los exploradores nativos (Nautilus, Dolphin, etc.), por lo que la interacción se realiza ejecutando **`TortoiseProc.exe`** con sus comandos de línea.

La ruta al ejecutable es:
```
.wine/drive_c/Program Files/TortoiseSVN/bin/TortoiseProc.exe
```

### Comandos Frecuentes

Definir alias de conveniencia en tu sesión:
```bash
alias tsvn='WINEPREFIX="$PWD/.wine" nix shell nixpkgs#wineWow64Packages.stable -c wine ".wine/drive_c/Program Files/TortoiseSVN/bin/TortoiseProc.exe"'
```

#### A. Abrir Navegador de Repositorios (Repo Browser)
```bash
tsvn /command:repobrowser
```
O con una URL específica:
```bash
tsvn /command:repobrowser /path:"http://svn.example.com/repo"
```

#### B. Abrir Configuración (Settings)
```bash
tsvn /command:settings
```

#### C. Checkout de un repositorio
```bash
tsvn /command:checkout /url:"http://svn.example.com/repo" /path:"Z:$PWD/my_checkout"
```

#### D. Ver Historial (Log)
```bash
tsvn /command:log /path:"Z:$PWD"
```

#### E. Herramientas Auxiliares
- **TortoiseMerge (Visor / resolutor de diferencias):**
  ```bash
  WINEPREFIX="$PWD/.wine" nix shell nixpkgs#wineWow64Packages.stable -c wine \
    ".wine/drive_c/Program Files/TortoiseSVN/bin/TortoiseMerge.exe"
  ```
- **TortoiseIDiff (Comparador de imágenes):**
  ```bash
  WINEPREFIX="$PWD/.wine" nix shell nixpkgs#wineWow64Packages.stable -c wine \
    ".wine/drive_c/Program Files/TortoiseSVN/bin/TortoiseIDiff.exe"
  ```
