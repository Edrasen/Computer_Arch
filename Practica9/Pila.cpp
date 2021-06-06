#include<iostream>
#include<stdlib.h>
#include<time.h>

using namespace std;

class Pila{
    private:
        //////INPUTS////
        bool up;
        bool dw;
        bool wpc;
        int pc[8];
        //int inst[8];
        short PCin;
        bool clr;

        unsigned short sp;

        ////OUTPUTS////
        short PCout;
        short SPout;

    public:
        Pila();
        void set(int*);
        void get();
        void operacion(short, bool, bool, bool, bool);
        void operacion();
};

Pila::Pila(){
    up = 0;
    dw = 0;
    wpc = 0;
    set(pc);
    //set(inst);
    PCin = 0x0;
    clr = 0;

    sp = 0;

    ////OUTPUTS////
    PCout = 0x0;
    SPout = 0x0;
}


void Pila::set(int *arr){
    srand(time(0));
    for(int i = 0; i < 8; i++){
        arr[i] = rand() % 1000;
    }
    sp = 0;
}

void Pila::get(){
    int i;
    for(i = 0; i < 8; i++){
        cout<<"Pila["<<i<<"]: "<<pc[i]<<"\n";
    }
}

void Pila::operacion(short pcIN, bool up, bool dw, bool wpc, bool clear){
    if(clear == 1){
        int i;
        for(i=0; i < 8; i++){
            pc[i] = 0;
        }
    }
        
    else
    {
        if(wpc == 0 && up == 0 && dw == 0){
            sp = sp;
            pc[sp]++;
        }
        else if(wpc == 1 && up == 0 && dw == 0){
            sp = sp;
            pc[sp] = pcIN;
        }
        else if(wpc == 1 && up == 1 && dw == 0){
            sp++;
            sp = sp % 8;
            pc[sp] = pcIN;
        }
        else if(wpc == 0 && up == 0 && dw == 1){
            sp--;
            sp = sp % 8;
            pc[sp]++;
        }
        else{
            PCout = pc[sp];
        }
    }
}

void Pila::operacion(){
    //sp = sp % 8;
    PCout = pc[sp];
    SPout = sp;
    cout<<"SP: "<<SPout<<"\n";
    cout<<"Pila["<<SPout<<"]: "<<PCout<<"\n";
}


///////////////*****TEST CODE*****///////////
int main(){
    //Creamos una instancia de pila
    Pila p1;
    //clear
    p1.operacion(0,0,0,0,1);
    
    //aqui inician las instrucciones//
    //1. LI R6, #87
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //2. LI R8, #90
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;
    
    //3. B 34
    //p1.operacion();
    p1.operacion(34,0,0,1,0);
    //p1.operacion();
    //cout<<endl;
    
    //4. ADD R8,R2,R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;
    
    //5. SUB R1, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //6. CALL 0x61
    //p1.operacion();
    p1.operacion(0x61,1,0,1,0);
    //p1.operacion();
    //cout<<endl;

    //7. LI R6, #87
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //8. LI R8, #90
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //9. CALL 100
    //p1.operacion();
    p1.operacion(100,1,0,1,0);
    //p1.operacion();
    //cout<<endl;

    //10. ADD R8, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //11. SUB R1, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //12. LI R6, #87
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //13. RET
    //p1.operacion();
    p1.operacion(0,0,1,0,0);
    //p1.operacion();
    //cout<<endl;
    
    //14. SUB R1, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //15. LI R6, #87
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //16. RET
    //p1.operacion();
    p1.operacion(0,0,1,0,0);
    //p1.operacion();
    //cout<<endl;

    //17. B 300
    //p1.operacion();
    p1.operacion(300,0,0,1,0);
    //p1.operacion();
    //cout<<endl;

    //18. CALL 889
    //p1.operacion();
    p1.operacion(889,1,0,1,0);
    //p1.operacion();
    //cout<<endl;

    //19. ADD R8, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //20. SUB R1, R2, R3
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //21. LI R6, #87
    //p1.operacion();
    p1.operacion(0,0,0,0,0);
    //p1.operacion();
    //cout<<endl;

    //22. RET
    //p1.operacion();
    p1.operacion(0,0,1,0,0);
    //p1.operacion();
    //cout<<endl;

    //23. RET
    //p1.operacion();
    p1.operacion(0,0,1,0,0);
    //p1.operacion();
    //cout<<endl;

    
    //Si hacemos el ultimo RET (Instruccion 23) el valor de SP se vuelve negativo.

    p1.get();   


}
