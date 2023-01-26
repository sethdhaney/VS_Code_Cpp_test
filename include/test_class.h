//      Test class
//      just tests VS code


#ifndef TEST_CLASS_H
#define TEST_CLASS_H

#include <string>

class test_class{
private:
    std::string to_print = "Hello World!";

public:
    //Constructor
    test_class(){};

    //Actual method
    void test(){
        printf("%s\n", to_print.c_str());
    };

};

#endif //TEST_CLASS_H
