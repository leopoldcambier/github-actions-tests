#include <upcxx/upcxx.hpp>
#include <stdio.h>

int main(int argc, char *argv[]){
    
    upcxx::init();
   
    printf("[%d/%d] Hello world (UPCXX)\n", upcxx::rank_me(), upcxx::rank_n()); 

    upcxx::finalize();
    
    return 0;
}
