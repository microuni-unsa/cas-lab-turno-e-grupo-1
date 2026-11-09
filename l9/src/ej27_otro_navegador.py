"""Ejercicio 27: el mismo guion en otro navegador.

Repite la comprobacion de Google en Firefox para demostrar que el codigo
WebDriver es intercambiable entre navegadores. Adapta
EJ27_Usando_internet_explorer.py: Internet Explorer se retiro en junio
de 2022 y su controlador solo existe para Windows, asi que Firefox con
geckodriver es el segundo navegador de esta practica.
"""

import unittest

from selenium.webdriver.common.by import By

from common import dismiss_google_consent, make_driver, screenshot


class TestOtroNavegador(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver(browser="firefox")
        self.addCleanup(self.driver.quit)

    def test_google_en_firefox(self):
        driver = self.driver
        print(f"Navegador: {driver.capabilities['browserName']}")
        print(f"Version: {driver.capabilities['browserVersion']}")
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        self.assertIn("Google", driver.title)
        caja = driver.find_element(By.NAME, "q")
        self.assertTrue(caja.is_displayed())
        caja.send_keys("selenium firefox geckodriver")
        screenshot(driver, "ej27-firefox.png")


if __name__ == "__main__":
    unittest.main(verbosity=2)
