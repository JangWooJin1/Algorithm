import java.util.*;

class Solution {
    //그냥 완탐 문제
    static int answer = 0;
    static int n, t;
    
    public int solution(int[] numbers, int target) {
        n = numbers.length;
        t = target;
        dfs(0,0,numbers);
        return answer;
    }
    
    public static void dfs(int cnt, int tmp, int[] numbers){
        if(cnt == n){
            if(tmp == t) answer++;
            return;
        }
        
        dfs(cnt+1, tmp + numbers[cnt], numbers);
        dfs(cnt+1, tmp - numbers[cnt], numbers);
    }
}