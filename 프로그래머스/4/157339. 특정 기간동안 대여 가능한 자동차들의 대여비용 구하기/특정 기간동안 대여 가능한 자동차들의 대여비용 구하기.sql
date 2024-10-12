-- 회사에서 대여 중인 자동차 정보 CAR_RENTAL_COMPANY_CAR
-- CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS
-- 자동차 ID, 자동차 종류, 일일 대여 요금(원), 자동차 옵션 리스트
-- 자동차 종류는 '세단', 'SUV', '승합차', '트럭', '리무진' 
-- 자동차 옵션 리스트는 콤마(',')로 구분된 키워드 리스트(예: ''열선시트,스마트키,주차감지센서'')
--     키워드 종류는 '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트' 

-- 자동차 대여 기록 정보 CAR_RENTAL_COMPANY_RENTAL_HISTORY
-- HISTORY_ID, CAR_ID, START_DATE, END_DATE
-- 동차 대여 기록 ID, 자동차 ID, 대여 시작일, 대여 종료일

-- 자동차 종류 별 대여 기간 종류 별 할인 정책 정보  CAR_RENTAL_COMPANY_DISCOUNT_PLAN
-- PLAN_ID, CAR_TYPE, DURATION_TYPE, DISCOUNT_RATE
-- 요금 할인 정책 ID, 자동차 종류, 대여 기간 종류, 할인율(%)
-- 대여 기간 종류로는 '7일 이상' (대여 기간이 7일 이상 30일 미만인 경우)
--                '30일 이상' (대여 기간이 30일 이상 90일 미만인 경우), 
--                '90일 이상' (대여 기간이 90일 이상인 경우)
-- 대여 기간이 7일 미만인 경우 할인 X

-- 자동차 종류가 '세단' 'suv' 자동차 중에서
-- 대여 기간이 2022-11-01 ~ 2022-11-30까지 대여 가능하고
-- 30일간 대여 금액이 50~200만원 미만인 자동차
-- 정렬: 대여 금액 DESC, 자동차 종류 ASC, 자동차 ID DESC

-- 10% 할인 = a * 0.9 = a * (1 - d/100)


        # SELECT *
        # FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        # WHERE (START_DATE BETWEEN '2022-11-01' AND '2022-11-30')
        #     OR (END_DATE > '2022-11-01')



SELECT C.CAR_ID, C.CAR_TYPE, FLOOR((C.DAILY_FEE * (1 - COALESCE(P.DISCOUNT_RATE, 0)/100)) * 30 ) AS FEE
FROM CAR_RENTAL_COMPANY_CAR AS C
LEFT OUTER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P ON P.CAR_TYPE = C.CAR_TYPE
WHERE C.CAR_TYPE IN ('세단', 'suv')
    AND C.CAR_ID NOT IN (
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE (START_DATE BETWEEN '2022-11-01' AND '2022-11-30')
            OR (END_DATE > '2022-11-01')
    )
    AND P.DURATION_TYPE = '30일 이상'
    AND (C.DAILY_FEE * (1 - COALESCE(P.DISCOUNT_RATE, 0)/100)) * 30 >= 500000 
    AND (C.DAILY_FEE * (1 - COALESCE(P.DISCOUNT_RATE, 0)/100)) * 30 < 2000000
GROUP BY C.CAR_ID, C.CAR_TYPE, FEE
ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID DESC


# LEFT OUTER JOIN ( 
#     SELECT CAR_ID, START_DATE, END_DATE,
#            CASE 
#                WHEN END_DATE - START_DATE >= 90 THEN '90일 이상'
#                WHEN END_DATE - START_DATE >= 30 THEN '30일 이상'
#                WHEN END_DATE - START_DATE >= 7 THEN '7일 이상'
#                ELSE '7일 미만'
#            END AS DURATION_TYPE
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
# ) AS R ON R.CAR_ID = C.CAR_ID
