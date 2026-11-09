"""Ejercicio 6: lectura y seleccion en un desplegable.

Recorre las opciones del desplegable nativo de la pagina de w3schools y
selecciona Nissan por su valor 10. Adapta EJ6_Usando_select.py, cuyo
XPath absoluto con id main ya no existe: usa el primer elemento select
de la pagina.
"""

import unittest

from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select, WebDriverWait

from common import make_driver, screenshot

URL = "https://www.w3schools.com/howto/howto_custom_select.asp"


class TestSelect(unittest.TestCase):
    def setUp(self):
        self.driver = make_driver()
        self.addCleanup(self.driver.quit)

    def test_usando_select(self):
        driver = self.driver
        driver.get(URL)
        desplegable = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, "(//select)[1]"))
        )
        opciones = desplegable.find_elements(By.TAG_NAME, "option")
        print(f"Opciones encontradas: {len(opciones)}")
        for opcion in opciones:
            print(
                f"Valor: {opcion.get_attribute('value')},"
                f" texto: {opcion.text}"
            )
        seleccion = Select(desplegable)
        seleccion.select_by_value("10")
        elegida = seleccion.first_selected_option
        print(f"Opcion elegida: {elegida.text}")
        self.assertEqual(elegida.text, "Nissan")
        screenshot(driver, "ej6-select.png")


if __name__ == "__main__":
    unittest.main(verbosity=2)
