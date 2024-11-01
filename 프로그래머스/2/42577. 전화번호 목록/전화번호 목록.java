import java.util.Arrays;

class Solution {
    public boolean solution(String[] phone_book) {
        // 전화번호를 사전순으로 정렬
        Arrays.sort(phone_book);
        
        // 인접한 두 전화번호를 비교하여 접두어 관계 확인
        for (int i = 0; i < phone_book.length - 1; i++) {
            if (phone_book[i + 1].startsWith(phone_book[i])) {
                return false;
            }
        }
        
        return true;
    }
}