# 라이브러리 추가
import pymysql
from dotenv import load_dotenv
import os

# .env 파일에서 환경 변수 로드
load_dotenv()

# 환경 변수 가져오기
db_host = os.getenv('DB_HOST')
db_user = os.getenv('DB_USER')
db_password = os.getenv('DB_PASSWORD')
db_name = os.getenv('DB_NAME')
db_charset = os.getenv('DB_CHARSET')

# 연결자 생성
conn = pymysql.connect(
    host=db_host,
    user=db_user,
    password=db_password,
    db=db_name,
    charset=db_charset
)

# 커서 생성
curs = conn.cursor()

# DB Table에 값 추가하는 SQL문 실행
sql = "DELETE FROM Product WHERE pCode='p005'"
curs.execute(sql)

# commit 실행
conn.commit()

# 데이터베이스 연결 종료
conn.close()