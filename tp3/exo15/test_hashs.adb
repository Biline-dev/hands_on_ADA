

with Text_Io;
use Text_Io;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Hashs;




procedure Test_Hashs is 


   Size : constant Positive := 500;  


   function Hash_Size (
         Key : in     Unbounded_String ) 
     return Natural is 
   begin
      return (Length(Key) mod Size);
   end Hash_Size;


   procedure Put (
         S : in     Unbounded_String ) is 
   begin
      Put(To_String(S));
   end Put;



   package Dictionnaire is new Hashs (Size,Unbounded_String,Hash_Size,Put);
   use Dictionnaire;


   My_Hash : Hash;  


begin

   Initialize(My_Hash);


   Add(My_Hash, To_Unbounded_String("Alinea"), To_Unbounded_String(
         "Retour a la ligne pour le debut d'un paragraphe avec renfoncement de cette premiere ligne dans la typographie classique."));

   Add(My_Hash, To_Unbounded_String("Kraft"), To_Unbounded_String(
         "Mot d'origine allemande signifiant « force », papier d'emballage tres resistant obtenu a partir de pate chimique au sulfate ou a la soude."));

   Add(My_Hash, To_Unbounded_String("Negatif"), To_Unbounded_String(
         "Image photographique ou les valeurs sont inversees par rapport a l'original. Antonyme : positif"));

   Add(My_Hash, To_Unbounded_String("Decale"), To_Unbounded_String(
         "Pli parallele effectue avec des intervalles irreguliers."));

   Add(My_Hash, To_Unbounded_String("Recto"), To_Unbounded_String(
         "Face d'une feuille, la premiere imprimee ou face d'un feuillet (Impression). - Page de droite dans un livre. Antonyme : verso ."));

   Add(My_Hash, To_Unbounded_String("Sigle"), To_Unbounded_String(
         "Graphisme des lettres d'une societe ou d'un organisme"));

   Add(My_Hash, To_Unbounded_String("Zone"), To_Unbounded_String(
         "Surface d'une illustration destinee a la photogravure, calculee par moyenne de ses dimensions en centimetres ."));




   Put(My_Hash);


   New_Line;
   New_Line;
   New_Line;
   Put(To_String(Consult(My_Hash,To_Unbounded_String("Sigle"))));
   New_Line;
   New_Line;
   Put(To_String(Consult(My_Hash,To_Unbounded_String("Recto"))));
   New_Line;


end Test_Hashs;




