#include <iostream>
using namespace std;

 int main()
    {
       int num1, num2, ch;
       cout << "\n enter two numbers";
       cout << "\n n1:";
       cin >> num1;
       cout <<"\n n2 :";
       cin >> num2;
       cout << "\n choose the operation";
       cout << "\n 1- for + ";
       cout << "\n 2- for - ";
       cout << "\n 3- for x ";
       cout << "\n 4- for % ";
       cin >> ch;
       switch (ch)
       {
   case 1:
    cout << "the addition = " << num1+num2 << endl;
    break;
   case 2:
       cout << "the subtraction = " << num1-num2 << endl;
    break;
   case 3:
       cout << "the multiplication" << num1*num2 << endl;
    break;
   case 4:
       cout << "the division" << float (num1)/float (num2) << endl;
    break;

default:
     cout << "the addition = " << num1+num2 << endl;
     cout << "the subtraction = " << num1-num2 << endl;
     cout << "the multiplication" << num1*num2 << endl;
    cout << "the division" << float (num1)/float (num2) << endl;

    break;


       }
       return 0;
    }
