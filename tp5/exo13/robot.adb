

with Text_Io;
use Text_Io;


procedure Robot is 

   type Commandes is 
         (A_Droite, 
          A_Gauche, 
          Avancer,  
          Reculer); 


   package Io is new Text_Io.Enumeration_Io(Commandes);
   use Io;

   Commandes_Incorrecte : exception;  
   Nb_Error             : Integer   := 0;  
   C                    : Commandes;  

begin

   loop
      begin

         New_Line;
         Put("Saisir la commande : ");
         Get(C);
         Put("La commande est : " );
         Put(C);
         New_Line;

      exception
         when  Data_Error =>
            Put_Line("Erreur de saisie");
            Skip_Line;
            Nb_Error:=Nb_Error+1;
            if Nb_Error=5 then
               raise Commandes_Incorrecte;
            end if;
      end;
   end loop;

end Robot;
