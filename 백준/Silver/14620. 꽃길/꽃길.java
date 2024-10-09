import java.util.*;

public class Main {

    static int[] dx = {-1,1,0,0};
    static int[] dy = {0,0,-1,1};
    static long result = Long.MAX_VALUE;
    static int n;
    static int[][] S;

    public static void main(String[] args){

        Scanner sc = new Scanner(System.in);

        n = Integer.valueOf(sc.nextLine());
        ArrayList<Node> all = new ArrayList<>();

        S = new int[n][n];

        StringTokenizer st;
        for(int i=0; i<n; i++){
            st = new StringTokenizer(sc.nextLine());
            for(int j=0; j<n; j++){
                S[i][j] = Integer.valueOf(st.nextToken());

                if(i != 0 && i != n-1 && j != 0 && j != n-1){
                    all.add(new Node(i,j));
                }
            }
        }
        //입력끝

        //1,1 ~ n-2,n-2
        int i=0,j=1,b=2;
        Node[] lst = new Node[3];
        for(; i<j; i++){
            for(j=i+1; j<b; j++){
                for(b=j+1; b<all.size(); b++){
                    lst[0] = all.get(i);
                    lst[1] = all.get(j);
                    lst[2] = all.get(b);
                    dfs(new boolean[n][n], lst);
                }
            }
        }

        System.out.print(result);
    }

    public static void dfs(boolean[][] visited, Node[] lst){
        int cost = 0;
        for(Node n : lst){
            if(visited[n.x][n.y]){
                return;
            }
            cost += S[n.x][n.y];
            visited[n.x][n.y] = true;

            for(int i=0; i<4; i++){
                int nx = n.x + dx[i];
                int ny = n.y + dy[i];

                if(visited[nx][ny]){
                    return;
                }
                cost += S[nx][ny];
                visited[nx][ny] = true;
            }
        }
        result = Math.min(result, cost);
    }

    static class Node{
        int x;
        int y;

        public Node(int _x, int _y){
            x = _x;
            y = _y;

        }
    }

}
