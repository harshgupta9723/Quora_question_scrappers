
#Libraries
import time
import datetime
import json 
import bs4
from bs4 import SoupStrainer
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import pandas as pd

def connect_chrome(login_flag):
    """
    Function To Initialize Chrome Driver
    :return: chromedriver
    """
    options = Options()
    #options.add_argument('--headless')
    options.add_argument('log-level=3')
    options.add_argument("--incognito")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")

    driver = webdriver.Chrome(options=options, executable_path="/home/user/py/chromedriver")
    driver.maximize_window()
    time.sleep(1)
    return driver


def google_search(driver, job):
    '''
    search about the job on google
    :param 'driver': ChromeDriver Object
    :param 'job' : job
    '''
    searchBox = driver.find_element(By.NAME, "q")
    searchBox.send_keys(job + ' jobs in Usa Quora')
    searchBox.send_keys(Keys.ENTER)
    time.sleep(0.5)


def related_quest(driver, url, job):
    '''
    Extract related questions from the website
    :param 'driver': ChromeDriver Object
    :param 'url': google's website
    :param 'job': job
    return : Dictionary
    '''
    driver.get(url)
    google_search(driver, job)
    html_source = driver.page_source
    page = bs4.BeautifulSoup(html_source, 'html.parser')
    links = page.find_all('div', class_="yuRUbf")
    
    links = driver.find_elements(By.XPATH, "//div[@class='g']/div/div/div/a")
    
    dic = {}
    li_href = []
    for link in links:
        href = link.get_attribute('href')
        href = str(href)
        if 'www.quora.com' in href:
            li_href.append(href)
    
    for href in li_href:

        print(href)
        driver.get(href)
        title = driver.find_element(By.XPATH, "//div[@class='q-text puppeteer_test_question_title']")
        key = title.text
  
        html_source = driver.page_source
        job_card = bs4.BeautifulSoup(html_source, 'html.parser')
        related_q = job_card.find('div', class_="q-box qu-mb--large").text
        related_q = related_q.strip()
  
        related_q = related_q.replace('Related questions','')
        li_q = related_q.split('?')
        li_q = li_q[0:len(li_q)-1]
        dic[key] = li_q

    return dic


def dict_to_df(dict):
    '''
    Convert Dictionary to DataFrame.
    :param 'dict' : Dictionary
    return : DataFrame
    '''
    df = pd.DataFrame()
    li_count = []
    li_values = []

    for count, key in enumerate(dict.keys()):
        c = count + 1
        li_count.append(c)
        li_values.append(key)
   
        for j in range(len(dict[key])):
            c_r = c + (j+1)/100
            li_count.append(c_r)
            li_values.append(dict[key][j])

    df['Count'] = li_count
    df['Questions'] = li_values

    return df


def main():
    '''
    Main Function
    '''
    driver = connect_chrome(False)
    url = 'https://www.google.co.in/'
    job = 'gig economy'

    dict = related_quest(driver, url, job)
    df = dict_to_df(dict)
    #print(df.tail(10))
    df.to_csv('related_q.csv',index=False)
    
    driver.close()


if __name__ == '__main__' :

    main()