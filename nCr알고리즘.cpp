#include<iostream>
#include<vector>
using namespace std;

//5C3의 결과가 아래와같이 저장됨
//[[0, 1, 2], [0, 1, 3], [0, 1, 4], [0, 2, 3], [0, 2, 4], [0, 3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]

/*
	동작방식 : nCr = n-1Cr-1 + n-1Cr의 형태를 이용

	n_range : n의 범위를 저장하는 배열 (ex> n=5이면, [0,1,2,3,4])
	tmp : r의 크기를 가지는 배열 생성 (ex> r=3이면, [-1,-1,-1])
	result : //최종결과 저장하는 2차원 배열 ([[0, 1, 2], [0, 1, 3], [0, 1, 4], [0, 2, 3], [0, 2, 4], [0, 3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]])
	index : tmp의 인덱스를 가리키는 변수
	depth : n_range의 인덱스를 가리키는 변수
*/
void comb(vector<int>& n_range, vector<int> tmp, vector<vector<int>> &result,  int n, int r, int index, int depth) {
	if (r == 0) result.push_back(tmp);	//더이상 선택할게 없으면 최종결과(result)에 추가
	else if (depth == n) return;		//r=0 이 아닌데 n_range를 끝까지 탐방했으면 유효하지 않은 것(추가x)
	else {
		tmp[index] = n_range[depth];								//depth번째 원소 선택 후 tmp에 저장
		comb(n_range, tmp, result, n, r - 1, index + 1, depth + 1);	// n-1Cr-1
		comb(n_range, tmp, result, n, r, index, depth + 1);			// n-1Cr
	}
}

int main() {
	vector< vector<int>> result;	
	vector<int> n_range;			
	vector<int> r_range;			
	int n = 5;
	int r = 3;

	//n의 범위를 저장 (ex> n=5이면, [0,1,2,3,4])
	for (int i = 0; i < n; i++) n_range.push_back(i);
	//r의 크기를 가지는 배열 생성 (ex> r=3이면, [-1,-1,-1])
	for (int i = 0; i < r; i++) r_range.push_back(-1);

	//함수호출
	comb(n_range, r_range, result, n, r, 0, 0);


	//함수결과확인
	for (int i = 0; i < result.size(); i++) {
		for (int j = 0; j < result[i].size(); j++) {
			cout << result[i][j] << ",";
		}
	}
}