-- 동물 보호소의 동물 정보 ANIMAL_INS(아이디, 생물종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부) 
-- 보호소에서 입양 보낸 동물 정보 ANIMAL_OUTS(아이디, 생물종, 입양일, 이름, 성별 및 중성화 여부)
-- 입양일이 보호 시작일 보다 먼저인 경우 = 입양일 < 보호 시작일
-- 정렬: 보호 시작일 오름차순

-- 코드를 입력하세요
SELECT AI.ANIMAL_ID, AI.NAME
FROM ANIMAL_INS AS AI
JOIN ANIMAL_OUTS AS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE AO.DATETIME < AI.DATETIME
ORDER BY AI.DATETIME