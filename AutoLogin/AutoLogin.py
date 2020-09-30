import os
from selenium import webdriver

chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--headless')

driver=webdriver.Chrome(executable_path='/usr/bin/chromedriver')
driver.get("https://www.google.com")