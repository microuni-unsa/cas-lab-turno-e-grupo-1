"""Ejercicio 3: escritura y sugerencias en Google con unittest.

Escribe selenium en el buscador y verifica el texto ingresado y las
sugerencias visibles. Adapta EJ3_usando_unittest.py: la red actual
redirige el envio de consultas a la pagina de verificacion de trafico
inusual de Google, asi que la prueba cubre la interaccion previa al
envio con una espera explicita de las sugerencias.
"""

import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import dismiss_google_consent, make_driver, screenshot


class TestBuscar(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_buscar(self):
        driver = self.driver
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        self.assertIn("Google", driver.title)
        caja = driver.find_element(By.NAME, "q")
        caja.send_keys("selenium")
        self.assertEqual(caja.get_attribute("value"), "selenium")
        sugerencias = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located(
                (By.XPATH, "(//ul[@role='listbox'])[1]")
            )
        )
        opciones = sugerencias.find_elements(By.XPATH, ".//li")
        print(f"Titulo: {driver.title}")
        print(f"Sugerencias visibles: {len(opciones)}")
        self.assertGreater(len(opciones), 0)
        screenshot(driver, "ej3-sugerencias.png")


if __name__ == "__main__":
    unittest.main(verbosity=2)
