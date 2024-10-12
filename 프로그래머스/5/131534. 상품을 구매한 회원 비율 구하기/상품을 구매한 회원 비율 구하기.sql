-- 의류 쇼핑몰의 회원 USER_INFO
-- USER_ID, GENDER, AGE, JOINED
-- ID, 성별, 나이, 가입일
-- GENDER는 비어있거나 / 0인 경우 남자를, 1인 경우는 여자

-- 온라인 상품 판매 정보 ONLINE_SALE
-- ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE
-- 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일
-- 동일 날짜 + 판매 + 회원은 한건만 존재

-- 2021년에 가입 & 상품을 구매한 회원수 + 비율(구매 회원수 / 21년 총 가입 수)
-- 비율은 2번째 자리 반올림
-- 정렬: 년 ASC, 월 ASC (상품)

SELECT
    YEAR (SALES_DATE) YEAR, 
    MONTH (SALES_DATE) MONTH, 
    COUNT (DISTINCT a.USER_ID) PURCHASED_USERS, 
    Round(COUNT (DISTINCT a.USER_ID)/(SELECT COUNT (*) FROM USER_INFO WHERE JOINED LIKE '2021%'),     1) AS PUCHASED_RATIO
FROM ONLINE_SALE a JOIN USER_INFO b
ON a.USER_ID = b.USER_ID
WHERE JOINED LIKE '2021%'
GROUP BY 1, 2
ORDER BY 1, 2