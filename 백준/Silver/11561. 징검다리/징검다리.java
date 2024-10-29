import java.util.*;
import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int t = Integer.parseInt(br.readLine());

        while(t-- > 0) {
            long n = Long.parseLong(br.readLine());
            long left = 0;
            long right = 1_000_000_000L;
            // long right = Integer.MAX_VALUE; 이것도 문제 없다.
            long result = 0;

            while (left <= right) {
                long mid = (left + right) >>> 1;
                long sum = (mid * (mid + 1)) / 2; // 등차수열 합 공식 적용

                /*
                문제 규칙 기준에서 입력 n에 대한 등차수열의 합은 n보다 작을 수밖에 없다.
                등차수열의 합이 n보다 작을 때를 찾아 해당 값(mid)과 이전 결과값(result) 중 최댓값 출력한다.
                 */
                if (sum <= n) {
                    // 이전 결과값과 현재 결과값 중 더 큰 값을 세팅한다.
                    result = Math.max(mid, result);
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }

            sb.append(result).append("\n");
        }

        System.out.println(sb);

        br.close();
    }

}