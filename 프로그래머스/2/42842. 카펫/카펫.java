import java.util.*;

class Solution {
    //가로 >= 세로
    public int[] solution(int brown, int yellow) {
        //노란색을 기준으로 가능한 경우 추출 -> 이때 세로가 더 긴거 제거
        // (1,2) -> (3,4)  => 경우의수 (a+2, b+2)  => 갈색 개수 = ((a+2) * (b+2)) - (a*b)
        // a - 세로 b - 가로  => (a <= b) 인 경우만
        // 1 2 3 4 5 6 8  12  24
        
        int a = 1, b = yellow;
        while(a<=b){
            if(yellow % a == 0){
                b = yellow / a;
                if( (((a+2) * (b+2)) - (a*b)) == brown ){
                    break;
                }
            }
            a++;    
        }
    
        int[] answer = {b+2,a+2};
        
        return answer;
    }
}