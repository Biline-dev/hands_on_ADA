with Text_Io;
use Text_Io;

with Piles;


procedure Test_Pile is 


   package Integerio is new Text_Io.Integer_Io(Integer);
   use Integerio;

   procedure Integer_Put (
         E : in     Integer ) is 
   begin
      Integerio.Put(E);
   end Integer_Put;
   
   Data,  
   Res,  
   Ope1,  
   Ope2     : Integer;  
   Operator : String (1 .. 10);  

   Last : Integer;  

   package Pile_Vect is new Piles(1024, Integer, Integer_Put);
   use Pile_Vect;

begin

   Put ("saisir les donnees et terminer la serie par 0");
   New_Line;

   loop
      Get (Data);
      exit when Data = 0;

      Empiler (Data);
   end loop;


   Put ("saisir les operateurs et terminer par q");
   New_Line;

   loop
      Get_Line (Operator, Last);
      exit when Operator (1) = 'q';


      case Operator (1) is

         when '+' =>
            Ope1 := Sommet;
            Depiler;
            Ope2 := Sommet;
            Depiler;
            Res := Ope1 + Ope2;
            Empiler (Res);
            Put ("valeur placee en sommet de pile = ");
            Put (Res);
            New_Line;
         when '*' =>
            Ope1 := Sommet;
            Depiler;
            Ope2 := Sommet;
            Depiler;
            Res := Ope1 * Ope2;
            Empiler (Res);
            Put ("valeur placee en sommet de pile = ");
            Put (Res);
            New_Line;
         when '-' =>
            Ope1 := Sommet;
            Depiler;
            Ope2 := Sommet;
            Depiler;
            Res := Ope1 - Ope2;
            Empiler ( Res);
            Put ("valeur placee en sommet de pile = ");
            Put (Res);
            New_Line;
         when '/' =>
            Ope1 := Sommet;
            Depiler;
            Ope2 := Sommet;
            Depiler;
            Res := Ope1 / Ope2;
            Empiler ( Res);
            Put ("valeur placee en sommet de pile = ");
            Put (Res);
            New_Line;
         when 'p' =>
            Res := Sommet;
            Put ("sommet = ");
            Put (Res);
            New_Line;
         when 'i' =>
            Put ("inverser = ");
            Inverser;
            New_Line;
         when 'a' =>
            Put ("afficher = ");
            afficher;
            New_Line;
         when others =>
            null;
      end case;
   end loop;



exception
   when Pile_Vide =>
      Put_Line("exception pile vide !");
   when Pile_Pleine =>
      Put_Line("exception pile pleine !");

end Test_Pile;


