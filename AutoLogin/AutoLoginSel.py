from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException

browser = webdriver.Firefox(executable_path='/home/pi/AutoLogin/GeckoDriver/geckodriver')
#driver.get('file:///home/pi/AutoLogin/LinksysSmartWi-Fi.html')
browser.get('http://msftconnecttest.com/redirect')

delay = 10
try:
	WebDriverWait(browser, delay).until(EC.presence_of_element_located((By.ID, 'guest-pass')))
	browser.find_element_by_id('guest-pass').send_keys("9193mtlyul")
	browser.find_element_by_id('submit-login').click()
except TimeoutException:
	print 'Could not find element password'

browser.quit()

#display.stop()
