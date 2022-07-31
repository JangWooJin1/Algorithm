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

void RecursiveQuickSort(int* list, int first, int last) {

	if (first < last) {											// first값과 last값이 처로 교차하면 재귀함수 호출x
		int SplitPoint = Split(list, first, last);				//Split()함수 호출 후 리턴 값으로 기준점 받기
		RecursiveQuickSort(list, first, SplitPoint - 1);		// 기준점의 왼쪽 부분을 재귀함수로 다시 호출
		RecursiveQuickSort(list, SplitPoint + 1, last);			// 기준점의 오른쪽 부분을 재귀함수로 다시 호출
	}
}


int main() {
	int list[LIST_SIZE];
	RecursiveQuickSort(list, 0, LIST_SIZE - 1);

	return 0;
}