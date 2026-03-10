#include <iostream>

using namespace std;

extern "C" int Teste1(int valor1, int valor2);
extern "C" int Teste2(int valor1);

int main() {
    cout << "Teste1 foi retornado: " << Teste1(30, 20) << endl;
    cout << "Teste2 foi retornado: " << Teste2(3) << endl;
    return 0;
}
