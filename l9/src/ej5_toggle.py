"""Ejercicio 5: accionamiento de un interruptor.

Pulsa dos veces el primer interruptor de la pagina de w3schools y verifica
que su estado conmuta en cada pulsacion. Adapta
EJ5_Accionando_Toggle_switch.py, cuyo XPath absoluto con id main ya no
existe en la pagina actual: usa el selector label.switch
input.inputdemo.
"""

import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from common import make_driver, screenshot

URL = "https://www.w3schools.com/howto/howto_css_switch.asp"
SELECTOR = "label.switch input.inputdemo"


class TestToggle(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_conmutar_interruptor(self):
        driver = self.driver
        driver.get(URL)
        interruptores = WebDriverWait(driver, 10).until(
            EC.presence_of_all_elements_located((By.CSS_SELECTOR, SELECTOR))
        )
        print(f"Interruptores encontrados: {len(interruptores)}")
        self.assertGreaterEqual(len(interruptores), 2)
        primero = interruptores[0]
        etiqueta = primero.find_element(By.XPATH, "./..")
        driver.execute_script(
            "arguments[0].scrollIntoView({block: 'center'});", etiqueta
        )
        driver.execute_script("window.scrollBy(0, 120);")
        inicial = primero.is_selected()
        etiqueta.click()
        WebDriverWait(driver, 10).until(
            lambda d: primero.is_selected() != inicial
        )
        print(f"Estado tras primera pulsacion: {primero.is_selected()}")
        screenshot(driver, "ej5-toggle.png")
        etiqueta.click()
        WebDriverWait(driver, 10).until(
            lambda d: primero.is_selected() == inicial
        )
        self.assertEqual(primero.is_selected(), inicial)


if __name__ == "__main__":
    unittest.main(verbosity=2)
