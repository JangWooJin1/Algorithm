-- 서점에서 판매하는 도서 정보 - BOOK
-- 서점에서 저자 정보 - AUTHOR

-- 경제 카테고리의 도서의 정보 출련
-- 정렬 출판일 오름차순 
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK AS B
JOIN AUTHOR AS A ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE