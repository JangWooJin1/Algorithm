#include<iostream>
using namespace std;

const int LIST_SIZE = 10;

void RecursiveMergeSort(int* list, int first, int last) {
	if (first < last) {									//first의 값과 last의 값이 교차하면 재귀중지	
		int mid = (first + last) / 2;
		RecursiveMergeSort(list, first, mid);			//중간값을 기준으로 왼쪽부분 재귀
		RecursiveMergeSort(list, mid + 1, last);		//중간값을 기준으로 오른쪽부분 재귀
		Merge(list, first, mid, last);					//위의 재귀함수로 배열이 다 쪼개졌으면 merge()함수로 합치면서 정렬
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
	RecursiveMergeSort(A, 0, LIST_SIZE - 1);

	return 0;
}