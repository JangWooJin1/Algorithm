import java.util.*;

class Solution {
    public int solution(String[][] clothes) {
        // 의상 종류별로 카운트
        HashMap<String, Integer> hm = new HashMap<>();
        
        // 각 의상 종류별 옷 개수를 저장
        for (String[] clothe : clothes) {
            hm.put(clothe[1], hm.getOrDefault(clothe[1], 0) + 1);
        }
        
        // 조합 계산
        int answer = 1;
        for (int count : hm.values()) {
            answer *= (count + 1); // 착용하지 않는 경우 포함하여 +1
        }
        
        return answer - 1; // 최소 하나의 옷은 착용해야 하므로 아무것도 입지 않는 경우 1가지 빼기
    }
}