-- 아이스크름 상반기 주문 정보 FIRST_HALF
-- SHIPMENT_ID, FLAVOR, TOTAL_ORDER
-- 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량

-- 7월 아이스크림 주문 정보 JULY
-- SHIPMENT_ID, FLAVOR, TOTAL_ORDER
-- 출하 번호, 아이스크림 맛, 7월 아이스크림 총주문량
-- 7월에는 아이스크림 주문량이 많아 같은 아이스크림에 대하여 서로 다른 두 공장에서 아이스크림 가게로 출하를 진행하는 경우가 있습니다

-- 7월 + 상반기 아이스크림 총 주문량
-- 정렬: 상위 3개의 맛

SELECT F.FLAVOR
FROM FIRST_HALF AS F
JOIN (
    SELECT J.FLAVOR, SUM(J.TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY AS J
    GROUP BY J.FLAVOR
) AS J2 ON F.FLAVOR = J2.FLAVOR
ORDER BY (J2.TOTAL_ORDER + F.TOTAL_ORDER) DESC
LIMIT 3