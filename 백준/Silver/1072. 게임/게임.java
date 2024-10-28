import java.util.*;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        StringTokenizer st = new StringTokenizer(sc.nextLine());

        //게임 횟수 X , 이긴 횟수 Y, 승률 Y/X
        long X = Long.valueOf(st.nextToken());
        long Y = Long.valueOf(st.nextToken());
        double tmp = (double) Y / X;
        long Z =  (long) ((long) Y * 100 / X);
//        System.out.println(Z);

        // (Y+n)/(X+n) -> 값이 변하는 n값 찾기 -> 파라메트릭 서치
        long start = 0;
        long end = Integer.MAX_VALUE;
        long answer = -1;
        long new_Z = -1;
        while(start <= end){
            long mid = (start + end) / 2;
            tmp = (double) (Y+mid) / (X+mid);
            new_Z = (long) ((long) (Y + mid) * 100 / (X + mid));
//          System.out.printf("mid: %d, tmp: %lf, y : %d, x : %d, z: %d\n", mid, (Y+mid), (X+mid), new_Z);

            if(new_Z != Z){
                answer = mid;
                end = mid - 1;
            } else {
                start = mid + 1;
            }
        }

        System.out.println(answer);

    }
}
