#include<iostream>
using namespace std;

const int LIST_SIZE = 10;

void NonRecursiveMergeSort(int* list, int first, int last) {
	// 2개의 stack 배열을 선언
	//St는 최종적으로 모든 분할 포인트 값(처음, 중간, 끝)을 저장하는 스택
	//T_S는 St에 분할 포인트 값을 모두 저장하기 위해 임시로 사용하는 스택
	int St[LIST_SIZE * 3];	int T_St[LIST_SIZE * 3];
	int top = -1;	int T_top = -1;

	int left = first;					//배열의 처음
	int mid = (first + last) / 2;		//배열의 중간
	int right = last;					//배열의 마지막

	// 2개의 스택 초기화 (right -> mid -> left 순서)
	St[++top] = right;	T_St[++T_top] = right;
	St[++top] = mid;	T_St[++T_top] = mid;
	St[++top] = left;	T_St[++T_top] = left;

	//임시스택 T_St에 값이 없을 때까지 반복
	while (T_top >= 0) {
		//T_St의 값을 pop하면서 left,mid,right값 업데이트(left -> mid -> right 순서)
		left = T_St[T_top--];
		mid = T_St[T_top--];
		right = T_St[T_top--];

		//mid+1값이 right보다 작으면(= 오른쪽으로 끝까지 분할이 안되었다면)
		if (mid + 1 < right) {
			//오른쪽으로 분할 한 후 2개의 스택에 저장(right -> mid -> left순서)
			T_St[++T_top] = right;					St[++top] = right;
			T_St[++T_top] = (right + mid + 1) / 2;	St[++top] = (right + mid + 1) / 2;
			T_St[++T_top] = mid + 1;					St[++top] = mid + 1;
		}

		//left값이 mid보다 작으면(= 왼쪽으로 끝까지 분할이 안되었다면)
		if (left < mid) {
			//왼쪽으로 분할 한 후 2개의 스택에 저장(right -> mid -> left순서)
			T_St[++T_top] = mid;					St[++top] = mid;
			T_St[++T_top] = (left + mid) / 2;		St[++top] = (left + mid) / 2;
			T_St[++T_top] = left;					St[++top] = left;
		}
	}

	//St스택에 저장된 모든 분할 포인트를 가지고 merge()함수를 호출해 합치면서 정렬
	while (top >= 0) {
		left = St[top--];
		mid = St[top--];
		right = St[top--];
		Merge(list, left, mid, right);
	}
}

void Merge(int* list, int first, int mid, int last) {
	int B[LIST_SIZE];		//합병의 결과를 임시 저장하는 배열
	int LPoint = first;		//배열의 처음부터 중간까지 탐색하는 변수
	int RPoint = mid + 1;	//배열의 중간부터 오른쪽까지 탐색하는 변수
	int BPoint = first;		//임시 배열의 인덱스의 값을 저장하는 변수


	//LPoint가 mid보다 커지거나(=왼쪽 부분 끝) RPoint가 last보다 커지면(=오른쪽 부분 끝) 반복 종료
	while (LPoint <= mid && RPoint <= last) {
		// 조건문을 이용하여 LPoint의 값과 RPoint의 값중 작은것을 임시 배열에 저장
		if (list[LPoint] < list[RPoint]) {
			B[BPoint++] = list[LPoint++];	//저장했으면 LPoint와 BPoint값 증가
		}
		else {
			B[BPoint++] = list[RPoint++];	//저장했으면 RPoint와 BPoint값 증가
		}
	}

	//LPoint이 mid보다 작다면(=왼쪽 부분의 값이 끝까지 들어가지 않았다면)
	while (LPoint <= mid) {
		B[BPoint++] = list[LPoint++];
	}

	//RPoint이 last보다 작다면(=오른쪽 부분의 값이 끝까지 들어가지 않았다면)
	while (RPoint <= last) {
		B[BPoint++] = list[RPoint++];
	}

	//임시저장에 저장된 값을 반복문을 이용하여 first부터 last까지 값 옮기기
	for (int i = first; i <= last; i++) {
		list[i] = B[i];
	}

}


int main() {
	int A[10] = { 30,20,40,35,5,50,45,10,25,15 };
	NonRecursiveMergeSort(A, 0, LIST_SIZE - 1);

	return 0;
}