from urllib.request import urlopen
import urllib.request
from bs4 import BeautifulSoup as bs
from urllib.parse import quote_plus
import ssl
import psycopg2
from flask import Flask
from flask import request
from psycopg2.extras import RealDictCursor
import json

# db에 접속
conn = psycopg2.connect(host='localhost',dbname='knu', user='knu', password='1234', port = '5432')
cur = conn.cursor(cursor_factory=RealDictCursor) # 커서 생성

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello Flask'

@app.route('/movie')
def info():
    title = request.args.get('title')
    title = "night"
    sql = "SELECT DISTINCT Original_title, DATE_PART('year', Start_year) AS Year, Movie_id FROM MOVIE LEFT OUTER JOIN GENRE_OF ON GENRE_OF.mid = Movie_id "
    + " LEFT OUTER JOIN ACTOR_OF ON ACTOR_OF.mid = Movie_id LEFT OUTER JOIN ACTOR ON aid = Actor_id LEFT OUTER JOIN VERSION ON VERSION.mid = Movie_id"
    + " WHERE " + " Original_title LIKE '%" + title + "%' "
    cur.execute(sql)
    data = json.dumps(cur.fetchall())
    return data




def getImg(title):
    ssl._create_default_https_context = ssl._create_unverified_context
    context = ssl._create_unverified_context()
    baseQueryUrl = 'https://www.themoviedb.org/search?language=ko-KR&query='
    baseUrl = "https://www.themoviedb.org"
    plusUrl = title
    crawl_num = 1
    # 한글 검색 자동 변환
    url = baseQueryUrl + quote_plus(plusUrl)
    html = urlopen(url)
    soup = bs(html, "html.parser")
    img = soup.find("div", class_= "poster")
    posterUrl = img.find("a")["href"]
    posterUrl = baseUrl + posterUrl
    html = urlopen(posterUrl)
    soup = bs(html, "html.parser") 
    div = soup.find("div", class_= "image_content backdrop")
    img = div.find("img")["data-src"]
    img = img[1: : ]
    img = img[1: : ]
    img = "http://" + img
    return img




