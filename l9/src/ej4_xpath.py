"""Ejercicio 4: localizacion por XPath relativo.

Ubica la caja de busqueda de Google por nombre y por XPath relativo,
comprueba que ambos localizadores resuelven el mismo elemento y
verifica las sugerencias visibles al escribir. Adapta
EJ4_buscando_elemento_por_xpath.py con esperas explicitas en lugar de
pausas fijas.
"""

import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import dismiss_google_consent, make_driver, screenshot


class TestXpath(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_buscar_por_xpath_relativo(self):
        driver = self.driver
        driver.get("http://www.google.com")
        dismiss_google_consent(driver)
        por_nombre = driver.find_element(By.NAME, "q")
        por_xpath = driver.find_element(By.XPATH, "//*[@name='q']")
        print(f"Nombre: {por_nombre.tag_name}, XPath: {por_xpath.tag_name}")
        self.assertEqual(por_nombre, por_xpath)
        por_xpath.send_keys("selenium")
        sugerencias = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located(
                (By.XPATH, "(//ul[@role='listbox'])[1]")
            )
        )
        opciones = sugerencias.find_elements(By.XPATH, ".//li")
        print(f"Sugerencias visibles: {len(opciones)}")
        self.assertGreater(len(opciones), 0)
        driver.execute_script(
            "arguments[0].style.border='4px solid red';", por_xpath
        )
        screenshot(driver, "ej4-sugerencias.png")


if __name__ == "__main__":
    unittest.main(verbosity=2)
