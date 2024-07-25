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

# SQL문 실행
sql = "SELECT * FROM Product"
curs.execute(sql)

# 모든 데이터 가져오기
result_all = curs.fetchall()

# result 타입 확인
print(type(result_all))

# 출력
for data in result_all:
    print(data)
    
print("==========")

# 2줄의 데이터만 가져오기
result_two = curs.fetchmany(2)

# 2줄의 데이터 출력
for data in result_two:
    print(data)

print("==========")

# 1줄의 데이터만 가져오기
result_one = curs.fetchone()

# 1줄의 데이터 출력
print(result_one)

##### fetchall 하게 되면 이미 data를 다 뽑아와서 더이상 뽑을게 없음.

# 데이터베이스 연결 종료
conn.close()