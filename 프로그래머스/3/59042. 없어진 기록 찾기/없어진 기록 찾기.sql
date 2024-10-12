-- 동물 보호소에 들어온 동물 - ANIMAL_INS
-- (ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
-- (동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부)
-- 동물 보호소에서 입양 보낸 동물 - ANIMAL_OUTS
-- (ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME)
-- (동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부)


-- 입양을 갔는데 보호소에는 없는 동물 = AO에는 있는데 AI에 없는 동물들
-- 정렬: 동물의 ID와 이름 오름차순

SELECT AO.ANIMAL_ID, AO.NAME
FROM ANIMAL_OUTS AS AO
WHERE AO.ANIMAL_ID NOT IN(
    SELECT AI.ANIMAL_ID
    FROM ANIMAL_INS AS AI
)
ORDER BY AO.ANIMAL_ID, AO.NAME