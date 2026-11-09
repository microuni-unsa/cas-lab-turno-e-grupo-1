"""Ejercicio 10: espera implicita.

Fija una espera implicita de cinco segundos y localiza la caja de
busqueda de Google. Adapta EJ10_usando_implicit_wait.py a la interfaz
vigente de Selenium 4.
"""

import unittest

from selenium.webdriver.common.by import By

from common import dismiss_google_consent, make_driver


class TestImplicitWait(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_usando_implicit_wait(self):
        driver = self.driver
        driver.implicitly_wait(5)
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        elemento = driver.find_element(By.NAME, "q")
        print(f"Elemento visible: {elemento.is_displayed()}")
        print(f"Titulo: {driver.title}")
        self.assertTrue(elemento.is_displayed())


if __name__ == "__main__":
    unittest.main(verbosity=2)
