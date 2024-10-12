-- 동물 보호소의 동물 정보들 
-- ANIMAL_INS(ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAK)
-- (동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부)
-- 동물 보호소에서 입양 보낸 정보들 
-- ANIMAL_OUTS(ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME)
-- (아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부)

-- 입양을 못간 동물 중, 가장 오래된 동물 3마리
-- 정렬 보호 시작일 오름차순

SELECT AI.NAME, AI.DATETIME
FROM ANIMAL_INS AS AI
WHERE AI.ANIMAL_ID NOT IN(
    SELECT AO.ANIMAL_ID
    FROM ANIMAL_OUTS AS AO
)
ORDER BY AI.DATETIME
limit 3