import java.util.*;

public class Main {

    public static void main(String[] args){
            Scanner sc = new Scanner(System.in);

            String str = sc.nextLine();
            //입력끝

            int s = 0;
            int e = str.length()-1;

            boolean isAllSame = true;
            boolean isPalln = true;

            //1. 모든 문자가 같은 경우 -> -1
            //2. 문자열이 회문인 경우 -> len - 1
            //3. 문자열이 회문이 아닌 경우 -> len
            while (s < e){
                if(str.charAt(s) != str.charAt(e)){ //팰린드롬 체크
                    isPalln = false;
                }

                if(str.charAt(s) != str.charAt(s+1)){ //모든 문자가 같은지 체크
                    isAllSame = false;
                }

                s++;
                e--;
            }

            if(isAllSame){
                System.out.println(-1);
            } else if(isPalln){
                System.out.println(str.length() - 1);
            } else {
                System.out.println(str.length());
            }

    }
}
