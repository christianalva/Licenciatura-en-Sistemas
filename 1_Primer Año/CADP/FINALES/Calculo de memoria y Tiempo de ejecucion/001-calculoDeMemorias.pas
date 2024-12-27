program uno;
cost 
    DF=10;//4 bytes
type 
    puntero=^real;//4 bytes 
    puntero2=^char;// 4 bytes 
    
    persona= record //25 bytes

        nombre:string[20];//21 bytes
        dni:integer;//4bytes
        
    end;
    
    puntPer=^persona;//4 bytes 
    
var 
    p:puntero;//4 bytes
    q:puntero2;// 4 bytes
    per:puntPer;//4 bytes
    perso:persona;//25 bytes
    

//LO QUE SE CALCULA EN LA MEMORIA ESTATICA ES LO DECLARADO EN LA VARIABLE 
// SUMANDO TODO HAY 41 BYTES DE MEMORIA ESTATICA.

// es todo memoria estatica, como no posee ningun new() ni dispose() no se modifica la mmoria dinamica  

//  al hacer new() se reserva memoria para el contenido de p, pero AL  HACER NIL NO SE LIBERA LA MEMORIA (p:=nil no libera memoria, sigue teniendo la misma que antes)
begin 
    
    //          CALCULO DE MEMORIA DINAMICA
    new(p);// 8 bytes (ya que p es un puntero a reales y los reales ocupan 8 bytes) 
    p:=nil;// segiria igual (con 8 bytes de memoria dinamica) 
    
    new(per);// 25 bytes (ya que es un puntero que apunta al registro persona)
    // HASTA ACA HABRIA 8 + 25 BYTES DE MEMORIA DINAMICA (33 BYTES EN TOTAL)
    
    read(per^.nombre);
    
    dispose(p);// LIBERO LA MEMORIA QUE HABIA RESERVADO CON NEW(P), ASI QUE SOLO QUEDARIAN LOS 25 BYTES DE NEW(PER)

end.