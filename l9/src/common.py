"""Controlador compartido para los ejercicios del laboratorio 9.

Resuelve el navegador y su controlador desde el entorno nix, de modo que
ningun guion depende de rutas de Windows ni de descargas manuales.
"""

import os
import shutil
from pathlib import Path

from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

BROWSER = os.environ.get("SELENIUM_BROWSER", "chrome").lower()
HEADLESS = os.environ.get("SELENIUM_HEADLESS", "1") != "0"
IMG_DIR = Path(__file__).resolve().parent.parent / "img"


def _which(*names):
    for name in names:
        path = shutil.which(name)
        if path:
            return path
    raise RuntimeError(
        f"Ninguno de estos binarios esta en PATH: {', '.join(names)}"
    )


def make_driver(browser=BROWSER, headless=HEADLESS):
    if browser == "firefox":
        options = FirefoxOptions()
        if headless:
            options.add_argument("-headless")
        options.binary_location = _which("firefox")
        executable = _which("geckodriver")
        service = FirefoxService(executable_path=executable)
        driver = webdriver.Firefox(service=service, options=options)
    else:
        options = ChromeOptions()
        if headless:
            options.add_argument("--headless=new")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--disable-gpu")
        options.add_argument("--window-size=1366,768")
        options.binary_location = _which(
            "chromium", "chromium-browser", "google-chrome"
        )
        executable = _which("chromedriver")
        service = ChromeService(executable_path=executable)
        driver = webdriver.Chrome(service=service, options=options)
    driver.set_page_load_timeout(30)
    return driver


def dismiss_google_consent(driver, timeout=5):
    xpath = (
        "//button[@id='L2AGLb' or contains(., 'Accept all')"
        " or contains(., 'Aceptar todo')]"
    )
    try:
        button = WebDriverWait(driver, timeout).until(
            EC.element_to_be_clickable((By.XPATH, xpath))
        )
    except TimeoutException:
        return False
    button.click()
    return True


def screenshot(driver, name):
    IMG_DIR.mkdir(parents=True, exist_ok=True)
    path = IMG_DIR / name
    driver.save_screenshot(str(path))
    print(f"Captura guardada en {path}")
    return path
