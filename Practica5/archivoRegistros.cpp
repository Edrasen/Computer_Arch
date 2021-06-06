#include<iostream>
#include<stdlib.h>
#include<time.h> 

using namespace std;

class archivoRegistros
{
private:
    short writeData;
    short writeReg;
    short readReg1;
    short readReg2;
    short shamt;
    bool wr;
    bool she;
    bool dir;
    bool clr;
    short readData1;
    short readData2;
    int banco[16];

public:
    archivoRegistros(/* args */);
    ~archivoRegistros();
    void set(int*);
    void get();
    void operacionSincrona(short, short, short, short, bool, bool, bool, bool);
    void operacionAsincrona(bool);
    void operacionAsincrona(bool, short, short);
};

archivoRegistros::archivoRegistros()
{
    writeData = 0x0;
    writeReg = 0x0;
    readReg1 = 0x0;
    readReg2 = 0x0;
    shamt = 0x0;
    wr = 0;
    she = 0;
    clr = 1;
    readData1 = 0x0;
    readData2 = 0x0;
    set(banco);
}

archivoRegistros::~archivoRegistros()
{
}

void archivoRegistros::set(int *banco)
{
    srand(time(0));
    for (int i = 0; i < 16; i++)
    {
        banco[i] = rand() % 1000;
    }   
}

void archivoRegistros::get()
{
    for (int i = 0; i < 16; i++)
    {
        cout<<"Reg["<<i<<"]: "<<banco[i]<<"\n";
    }
}

void archivoRegistros::operacionSincrona(short writeD, short writeR, short readR, short shmt, bool wr, bool shifte, bool dirr, bool clraR){
    if(clraR == 1)                                      //reset
        operacionAsincrona(clraR);
    else
    {
        if(writeR == 0 && shifte == 0 && dirr == 0){    //retencion
            for (int i = 0; i < 16; i++)
                banco[i] = banco[i]; 
        }
        else if (wr == 1 && shifte == 0)
        {
            banco[writeR] = writeD;                      //guarda en la localidad wR el valor de wD
        }
        else if (wr == 1 && shifte == 1)
        {
            if(dirr == 0){
                banco[writeR] = banco[readR] >> shmt;    //desplazamiento a la derecha
                cout<<"Corrimiento a la derecha  de "<<shmt<<" bits sobre registro:"<<readR<<" guardado en registro: "<<writeR<<"\n";
            }else {
                cout<<"Corrimiento a la izquierda  de "<<shmt<<" bits sobre registro:"<<readR<<" guardado en registro: "<<writeR<<"\n";
                banco[writeR] = banco[readR] << shmt;    //desplazamiento a la izquierda
            }
        }
        else
            cout<<"\nOPERACION NO VALIDA\n\n";
    }
}

void archivoRegistros::operacionAsincrona(bool clear)
{
    if(clear == 1){                                  //reset
        cout<<"\n\nReset de archivo de registros.\n";
        for(int i = 0; i < 16; i++)
            banco[i] = 0;
    }
}

void archivoRegistros::operacionAsincrona(bool clear, short readR1, short readR2)
{
    if(clear == 1)
        operacionAsincrona(1);
    else{
        readData1 = banco[readR1];
        readData2 = banco[readR2];
        cout<<"\nDato 1: "<<readData1<<"\n";
        cout<<"Dato 2: "<<readData2<<"\n";
    }
}

int main() {
   archivoRegistros aR1;

    aR1.operacionAsincrona(1);                  //punto 1
    aR1.operacionSincrona(89,1,0,0,1,0,0,0);    //punto 2
    aR1.operacionSincrona(72,2,0,0,1,0,0,0);    //punto 3
    aR1.operacionSincrona(123,3,0,0,1,0,0,0);   //punto 4
    aR1.operacionSincrona(53,4,0,0,1,0,0,0);    //punto 5
    cout<<"\nArchivo de registros despues de operacion:\n";
    //aR1.get();
    aR1.operacionAsincrona(0,1,2);              //punto 6
    aR1.operacionAsincrona(0,3,4);              //punto 7
    aR1.operacionSincrona(0,2,1,3,1,1,1,0);     //punto 8
    aR1.operacionSincrona(0,4,3,5,1,1,0,0);     //punto 9
    aR1.operacionAsincrona(0,1,2);              //punto 10
    aR1.operacionAsincrona(0,3,4);              //punto 11
    cout<<"\n";     
    aR1.get();                                  //punto 12
    aR1.operacionAsincrona(1);                  //punto 13
    aR1.get();
    
   return 0;
}