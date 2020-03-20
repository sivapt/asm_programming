// ConsoleApplication2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>

#include "pch.h"
#include <iostream>

extern "C" int addASM(int a, int b, int c);
extern "C" int muldivASM(int a, int b, int *prod, int *quot, int *rem);
extern "C" void productsumASM(int a, int b, int c, int *d, int *e, int *f);

int addCPP(int a, int b, int c);

int main() {
	int a = 1;
	int b = 2;
	int c = 3;
	int d, e, f;

	int sum = addASM(a, b, c);
	printf("a:%d b:%d c:%d; sum:%d\n", a, b, c, sum);

	int ret = muldivASM(b, a, &c, &d, &e);
	if (ret)
		printf("a:%d b:%d prod:%d quot:%d remind:%d\n", b, a, c, d, e);
	else
		printf("Divide by zero exception!");
	c = 3;
	productsumASM(a, b, c, &d, &e, &f);
	printf("a:%d b:%d c:%d sum:%d squaresum:%d cubesum:%d\n", a, b, c, d, e, f);

	return 0;
}

int addCPP(int a, int b, int c) {
	return (a + b + c);
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
