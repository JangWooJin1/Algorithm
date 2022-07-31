#include<iostream>
using namespace std;

const int LIST_SIZE = 10;

int Split(int* list, int first, int last) {
	int Pivot = list[first];								//가장 왼쪽 값을 기준값으로 선언
	int left = first;										//기준값을 가지고 왼쪽부터 탐색하기 위한 변수 선언(기준값보다 작은 값)
	int right = last + 1;									//기준값을 가지고 오른쪽부터 탐색하기 위한 변수 선언(기준값보다 큰 값)
	while (left < right) {									//왼쪽탐색과 오른쪽 탐색이 교차하면 반복 종료	
		while (list[++left] > Pivot && left <= last);		// 왼쪽 탐색 변수가 기준값 보다 작은 값을 찾거나 배열 끝에 도달하면 반복 종료
		while (list[--right] < Pivot && right >= first);	// 오른쪽 탐색 변수가 기준값 보다 큰 값을 찾거나 배열 끝에 도달하면 반복 종료

		if (left >= right) break;							//위에 반복문으로 왼쪽, 오른쪽이 서로 교차되어있으면 값 교체하지말고 반복문 탈출
		swap(list[left], list[right]);						// 왼쪽 오른쪽 교차되어있지 않으면 서로 값 교환	
	}

	swap(list[first], list[right]);							// 다 교체 했으면 최종적으로 기준값과 오른쪽 탐색 값(기준값보다 큰 값)을 서로 교체

	return right;											// 기준값이 있는 인덱스 리턴
}

void NonRecursiveQuickSort(int* list, int first, int last) {
	//분할 포인트 값(처음과 끝)을 저장하기 위한 스택 배열 선언
	int St[LIST_SIZE];
	int top = -1;

	int left, right;

	//스택 초기화(left->right순서)
	St[++top] = first;
	St[++top] = last;

	//스택의 값이 없을 때까지 반복
	while (top >= 0) {
		//스택의 값을 pop하면서 left,right값 업데이트(right->left순서)
		right = St[top--];
		left = St[top--];

		//left와 right값을 Split()함수에 전달 후 분할되는 부분의 값 리턴 
		int SplitPoint = Split(list, left, right);

		//right가 SplitPoint +1보다 클 때(=아직 오른쪽 부분이 남았을 때)
		if (right > SplitPoint + 1) {
			//스택에 left와 right값 추가(left->right순서)
			St[++top] = SplitPoint + 1;
			St[++top] = right;
		}

		//left가 SplitPoint -1보다 작을 때(=아직 왼쪽 부분이 남았을 때)
		if (left < SplitPoint - 1) {
			//스택에 left와 right값 추가(left->right순서)
			St[++top] = left;
			St[++top] = SplitPoint - 1;
		}
	}

}

int main() {
	int list[LIST_SIZE];
	NonRecursiveQuickSort(list, 0, LIST_SIZE - 1);

	return 0;
}