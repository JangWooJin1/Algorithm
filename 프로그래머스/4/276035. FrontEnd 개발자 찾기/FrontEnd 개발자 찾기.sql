-- 개발자가 사용하는 언어 정보 - SKILLCODES
-- (NAME, CATEGORY, CODE)
-- (이름, 스킬의 범주, 스킬의 코드) 
-- 스킬의 코드는 2진수로 표현했을 때 각 bit로 구분될 수 있도록 2의 제곱수로 구성되어 있습니다.
-- 개발자들의 프로그래밍 스킬 정보 - DEVELOPERS
-- (ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_CODE)
-- (ID, 이름, 성, 이메일, 스킬 코드)
-- 예를 들어 어떤 개발자의 SKILL_CODE가 400 (=b'110010000')이라면, 이는 SKILLCODES 테이블에서 CODE가 256 (=b'100000000'), 128 (=b'10000000'), 16 (=b'10000') 에 해당하는 스킬을 가졌다는 것을 의미합니다.



-- DEVELOPERS에서 프론트 스킬을 가진 개발자 조회 
-- 정렬 ID기준 오름차순
-- 16, 2048, 8192 - skills
-- 400,2048,8452 - 정답


SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS AS D, (
    SELECT CODE
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
) AS S
WHERE D.SKILL_CODE & S.CODE = S.CODE
GROUP BY D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
ORDER BY D.ID


