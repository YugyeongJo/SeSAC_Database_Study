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
# p_code = 'P005'
# sql = "SELECT * FROM Product WHERE pCode = %s"
# curs.execute(sql, (p_code,))

p_code = 'P002'
sql = f"SELECT * FROM Product WHERE pCode = '{p_code}'"
curs.execute(sql)

# 모든 데이터 가져오기
result_all = curs.fetchall()

# 출력
for data in result_all:
    print(data)
    
print("==========")