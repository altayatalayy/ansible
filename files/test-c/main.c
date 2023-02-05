#include <stdio.h>

int func(int a){
	printf("%d\n", a);
	return 0;
}

int func2(){
    int a = '1';
    return (int)&a;
}

int main(){
	int rv = func(5);
	return 0;
}
