import java.util.*;

public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        String str_input = sc.nextLine();

        // 이중 콜론이 있는지 확인
        boolean hasDoubleColon = str_input.contains("::");
        
        // 이중 콜론을 처리하기 위해 먼저 ":"로 나누기
        String[] parts = str_input.split(":");

        // 완성된 IPv6 주소를 담을 리스트
        List<String> result = new ArrayList<>();
        
        // 이중 콜론 처리
        if (hasDoubleColon) {
            // 이중 콜론의 위치를 기준으로 나누기
            int doubleColonIndex = str_input.indexOf("::");
            String[] left = str_input.substring(0, doubleColonIndex).split(":");
            String[] right = str_input.substring(doubleColonIndex + 2).split(":");
            
            // 왼쪽과 오른쪽 부분을 모두 더해서 8자리를 채우기
            result.addAll(Arrays.asList(left));
            int fillZerosCount = 8 - (left.length + right.length);
            for (int i = 0; i < fillZerosCount; i++) {
                result.add("0000");  // 빈 그룹은 "0000"으로 채우기
            }
            result.addAll(Arrays.asList(right));
        } else {
            // 이중 콜론이 없을 때는 그냥 나누기만
            result.addAll(Arrays.asList(parts));
        }

        // 각 그룹을 4자리로 맞추기
        StringBuilder sb = new StringBuilder();
        for (String part : result) {
            sb.append(String.format("%1$4s", part).replace(' ', '0')).append(":");
        }

        // 마지막 콜론 제거
        sb.deleteCharAt(sb.length() - 1);

        // 결과 출력
        System.out.println(sb.toString());
    }
}