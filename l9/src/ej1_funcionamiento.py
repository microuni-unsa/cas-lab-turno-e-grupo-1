"""Ejercicio 1: comprobacion del funcionamiento de Selenium.

Abre python.org en Chromium y verifica titulo y direccion. Adapta
EJ1_Prueba_funcionamiento_selenium.py, que fijaba la ruta del controlador
de Windows y dejaba el navegador abierto.
"""

import unittest

from common import make_driver, screenshot


class TestFuncionamiento(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_abrir_python_org(self):
        driver = self.driver
        driver.get("http://www.python.org")
        print(f"Titulo: {driver.title}")
        print(f"Direccion: {driver.current_url}")
        self.assertIn("Python", driver.title)
        screenshot(driver, "ej1-python-org.png")


if __name__ == "__main__":
    unittest.main(verbosity=2)
