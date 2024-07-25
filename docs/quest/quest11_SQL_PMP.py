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

print("###################################")
print("      ◆ 제품 관리 프로그램 ◆")
print("###################################")

while True:
    answer = input("◆ 메뉴를 선택하세요 => 전체제품보기(1), 제품검색(2), 제품추가(3), 제품수정(4), 제품삭제(5), 종료(exit) : ")
    if answer == '1':
        # SQL문 실행
        sql = "SELECT * FROM Product"
        curs.execute(sql)

        # 모든 데이터 가져오기
        result_all = curs.fetchall()

        # 출력
        print('------------------------------------------')
        print('제품번호      제품명      가격      수량')
        print('------------------------------------------')
        for data in result_all:
            item01 = data[0]
            item02 = data[1]
            item03 = data[2]
            item04 = data[3]
            print(item01, '        ', item02, '    ', item03, '    ', item04)
            pass
        
    elif answer == '2':
        # 상품검색
        item = input("검색하고자 하는 제품의 제품명을 입력해주세요 : ")
        
        # 입력값이 영어인지 확인하는 조건
        if not item.isalpha():
            print("등록된 제품명이 아닙니다. 다시 입력해주세요. : ")
            continue

        # 첫 글자만 대문자로, 나머지는 소문자로 변환
        item = item[0].upper() + item[1:].lower()
        
        # 변경된 값을 p_code에 저장
        p_code = item
        
        # SQL문 실행
        sql = "SELECT * FROM Product WHERE pName = %s"
        curs.execute(sql, (p_code,))

        # 모든 데이터 가져오기
        result_all = curs.fetchall()

        # 출력
        print('-----------------------------------------------')
        print('제품번호      제품명         가격      수량')
        print('-----------------------------------------------')
        for data in result_all:
            item01 = data[0]
            item02 = data[1]
            item03 = data[2]
            item04 = data[3]
            print(item01, '        ', item02, '       ', item03, '    ', item04)
            pass
        
    elif answer == '3':
        print("추가로 등록하고자 하는 상품 정보를 입력해주세요.")
        pcode = input("pCode : ")
        pname = input("pName(영어로) : ")
        price = int(input("price(숫자만) : "))
        amount = int(input("amount(숫자만) : "))
        
        # DB Table에 값 추가하는 SQL문 실행
        sql = f"INSERT INTO Product(pCode, pName, price, amount) VALUES('{pcode}', '{pname}', {price}, {amount})"
        curs.execute(sql)

        # commit 실행
        conn.commit()
    
    elif answer == '4':
        item = input("수정할 상품의 제품번호를 입력하세요 : ")
        pcode = item[0].upper() + item[1:].lower()
        
        while True:
            modify = input("수정할 상품 정보를 입력해주세요(제품명(1), 가격(2), 수량(3)) : ")
            
            if modify == '1':
                what = 'pName'
                item = input("변경하고자 하는 제품명을 입력해주세요(영어로) : ")
                if not item.isalpha():
                    print("오류: 제품명은 영어 알파벳만 포함해야 합니다. 다시 입력해주세요.")
                    continue
                how = item[0].upper() + item[1:].lower()
                break
            elif modify == '2':
                what = 'price'
                how = input("변경하고자 하는 금액을 입력해주세요(숫자만) : ")
                if not how.isdigit():
                    print("오류: 금액은 숫자만 포함해야 합니다. 다시 입력해주세요.")
                    continue
                break
            elif modify == '3':
                what = 'amount'
                how = input("변경하고자 하는 수량을 입력해주세요(숫자만) : ")
                if not how.isdigit():
                    print("오류: 수량은 숫자만 포함해야 합니다. 다시 입력해주세요.")
                    continue
                break
            else:
                print("오류: 유효한 값을 입력해주세요(1, 2, 3).")
        
        # DB Table에 값 수정하는 SQL문 실행
        sql = f"UPDATE Product SET {what}='{how}' WHERE pCode='{pcode}'"
        curs.execute(sql)

        # commit 실행
        conn.commit()
    
    elif answer == '5':
        del_product = input("삭제하실 상품의 제품번호를 입력해주세요 : ")
        
        # DB Table에 값 추가하는 SQL문 실행
        sql = "DELETE FROM Product WHERE pCode = %s"
        curs.execute(sql, (del_product))

        # commit 실행
        conn.commit()
    
    elif answer == 'exit':
        break
    
    else: 
        pass