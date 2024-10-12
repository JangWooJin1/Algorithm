-- 쇼핑몰 상품 판매 - PRODUCT (상품ID, 코드(카테고리코드-상품코드), 판매가)
-- 오프라인 상품 판매 - OFFLINE_SALE (상품ID, 판매량, 판매일)
-- 단, 동일한 날짜에는 하나의 상품 ID만 존재

-- 상품코드별 매출액(판매가 * 판매량)

-- 코드를 입력하세요
SELECT P.PRODUCT_CODE, OS.AMOUNT * P.PRICE AS SALES
FROM PRODUCT AS P
JOIN (
    SELECT PRODUCT_ID, SUM(SALES_AMOUNT) AS AMOUNT
    FROM OFFLINE_SALE
    GROUP BY PRODUCT_ID
) AS OS ON OS.PRODUCT_ID = P.PRODUCT_ID
ORDER BY SALES DESC, P.PRODUCT_CODE;
