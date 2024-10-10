import java.util.*;

public class Main {

    static int n;
    static ArrayList<String> result = new ArrayList<>();
    static String[] s;
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        n = Integer.valueOf(sc.nextLine());

        s = sc.nextLine().split(" ");
        //입력끝

        boolean[] used;

        //초기 설정
        String str;
        for(int i=0; i<=9; i++) {
            str = "" + i;
            used = new boolean[10];
            used[i] = true;

            dfs(str, used, 0, i);
        }

        System.out.print(result.get(result.size()-1) + "\n" +result.get(0));


    }

    // s[i]인 경우 str[i]와 str[i+1]을 비교
    // 1 2 3
    // < <
    public static void dfs(String str, boolean[] used, int cnt, int now) {
        if(cnt == n){
            result.add(str);
            return;
        }

        used[now] = true;

        for(int i=0; i<=9; i++){
            if(used[i]){
                continue;
            }

            if(s[cnt].equals(">")){
                if(str.charAt(cnt) - '0' < i){
                    continue;
                }

            } else{
                if(str.charAt(cnt) - '0' > i){
                    continue;
                }
            }
            dfs(str + i, copyArr(used), cnt + 1, i);
        }

    }

    static boolean[] copyArr(boolean[] arr){
        boolean[] new_arr = new boolean[arr.length];

        for(int i=0; i<arr.length; i++){
            new_arr[i] = arr[i];
        }

        return new_arr;
    }


}
