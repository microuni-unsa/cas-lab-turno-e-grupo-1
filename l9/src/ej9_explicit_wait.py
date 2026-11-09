"""Ejercicio 9: espera explicita.

Espera hasta diez segundos la presencia de la caja de busqueda de
Google. Adapta EJ9_usando_explicit_wait.py a la interfaz vigente de
Selenium 4.
"""

import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import dismiss_google_consent, make_driver


class TestExplicitWait(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_usando_explicit_wait(self):
        driver = self.driver
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        elemento = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.NAME, "q"))
        )
        print(f"Elemento visible: {elemento.is_displayed()}")
        print(f"Titulo: {driver.title}")
        self.assertTrue(elemento.is_displayed())


if __name__ == "__main__":
    unittest.main(verbosity=2)
