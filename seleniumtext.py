from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
from selenium import webdriver

# driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver = webdriver.Chrome(executable_path="C:\Program Files\Google\Chrome\Application\Chrome.exe")

driver.maximize_window()

wait = WebDriverWait(driver, 60)

driver.get('http://localhost/meeting/alogin.php')

# wait.until(EC.url_to_be('http://localhost/meeting/alogin.php'))
# sign_in=driver.find_element(By.ID, "rollnumber")
# sign_in.click()


WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.ID, "rollnumber")))
# WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div/div[2]/div/form/div[2]/div[1]/div/div[1]/div[1]/div[1]"))).click()
active_ele = driver.switch_to.active_element
active_ele.send_keys("admin")
active_ele.send_keys(Keys.ENTER)

WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.ID, "password")))
# WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div/div[2]/div/form/div[2]/div[2]/div/div[1]/div[1]"))).click()


active_ele = driver.switch_to.active_element
active_ele.send_keys("12345")
active_ele.send_keys(Keys.ENTER)

sign_in=driver.find_element(By.NAME, "adminLogin")
sign_in.click()

