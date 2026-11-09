"""Ejercicio 7: cambio entre ventanas y pestanas.

Abre una segunda pestana, carga example.com en ella y vuelve a la
primera. Adapta EJ7_Cambiar de ventana_o_pestana.py: usa example.com en
lugar de stackoverflow.com como destino determinista y esperas
explicitas en lugar de pausas fijas.
"""

import unittest

from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import dismiss_google_consent, make_driver, screenshot


class TestVentanas(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_cambiar_de_pestana(self):
        driver = self.driver
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        self.assertIn("Google", driver.title)
        driver.execute_script("window.open('');")
        WebDriverWait(driver, 10).until(EC.number_of_windows_to_be(2))
        driver.switch_to.window(driver.window_handles[1])
        driver.get("https://example.com")
        WebDriverWait(driver, 10).until(EC.title_contains("Example Domain"))
        print(f"Pestana 2: {driver.title} en {driver.current_url}")
        screenshot(driver, "ej7-segunda-pestana.png")
        driver.switch_to.window(driver.window_handles[0])
        self.assertIn("Google", driver.title)
        print(f"Pestana 1: {driver.title} en {driver.current_url}")


if __name__ == "__main__":
    unittest.main(verbosity=2)
