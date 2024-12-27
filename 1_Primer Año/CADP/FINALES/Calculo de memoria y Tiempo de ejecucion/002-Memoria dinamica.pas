program dos;
type
    puntero=^real;
    puntero2=^char;
    
    persona=record  //25 bytes
        nombre:string[20];
        dni:integer;
    end;
    
    punPer=^persona;

var 

    p,p1:puntero;// p= 4 bytes; p1= 4bytes
    per:punPer;// per= 4 bytes

begin 
    //  MEMORIA DINAMICA
    new(per);// 25 bytes
    new(p);// 8 bytes
    p^:=8;
    p1:=p;
    dispose(p1);// -8 bytes
    
    // POR LO TANTO HABRIA 25 BYTES DE MEMORIA DINAMICA
end.