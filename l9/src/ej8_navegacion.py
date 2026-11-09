"""Ejercicio 8: navegacion atras y adelante.

Visita Google, Gmail y YouTube, retrocede dos veces y avanza una, con
verificacion de la direccion en cada paso. Adapta
EJ8_Ir_a_la_pagina_anterio_o_la_siguiente.py con esperas explicitas en
lugar de pausas fijas.
"""

import unittest

from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import dismiss_google_consent, make_driver, screenshot


class TestNavegacion(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_atras_y_adelante(self):
        driver = self.driver
        espera = WebDriverWait(driver, 15)
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        espera.until(EC.url_contains("google.com"))
        driver.get("http://www.gmail.com")
        espera.until(
            lambda d: "mail.google.com" in d.current_url
            or "accounts.google.com" in d.current_url
        )
        print(f"Gmail redirige a {driver.current_url}")
        driver.get("http://www.youtube.com")
        espera.until(EC.url_contains("youtube.com"))
        print(f"YouTube en {driver.current_url}")
        screenshot(driver, "ej8-youtube.png")
        driver.back()
        espera.until(
            lambda d: "mail.google.com" in d.current_url
            or "accounts.google.com" in d.current_url
        )
        driver.back()
        espera.until(EC.url_contains("google.com"))
        print(f"Tras retroceder dos veces: {driver.current_url}")
        driver.forward()
        espera.until(
            lambda d: "mail.google.com" in d.current_url
            or "accounts.google.com" in d.current_url
        )
        print(f"Tras avanzar una vez: {driver.current_url}")


if __name__ == "__main__":
    unittest.main(verbosity=2)
