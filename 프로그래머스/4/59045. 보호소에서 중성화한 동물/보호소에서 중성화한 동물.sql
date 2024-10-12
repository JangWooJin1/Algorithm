-- 보호소 들어온 동물 ANIMAL_INS
-- ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE
-- 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부
-- 보호소 나간(입양) 동물 ANIMAL_OUTS
-- ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME
-- 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부

-- 보호소에 들어올땐 AI 중성화 X and 보호소 나갈때 AO 중성화 O
-- 정렬: ID 오름차순

SELECT AI.ANIMAL_ID, AI.ANIMAL_TYPE, AI.NAME
FROM ANIMAL_INS AS AI
JOIN ANIMAL_OUTS AS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE NOT (AI.SEX_UPON_INTAKE LIKE 'Neutered%' OR AI.SEX_UPON_INTAKE LIKE 'Spayed%') AND (AO.SEX_UPON_OUTCOME LIKE 'Neutered%' OR AO.SEX_UPON_OUTCOME LIKE 'Spayed%')
ORDER BY AI.ANIMAL_ID