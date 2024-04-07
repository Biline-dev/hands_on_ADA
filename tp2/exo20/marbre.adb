with arbre;
with text_io;
use text_io;

-- Change 'Integer' to 'Float' in the following line
procedure marbre is 

package Floatio is new float_io(float);  -- Change to float_io
use Floatio;  -- Change to Floatio

-- Change 'Integer_Put' to 'Float_Put' in the following line
procedure Float_Put (
         E : in     Float ) is 
   begin
      Put(E);
   end Float_Put;

-- Change 'Integer_add' to 'Float_add' in the following line
function Float_add (e1 : in     Float;
         e2 : in  Float) return Float is 
   begin
      return  e1 + e2;
   end Float_add;

package iarbre is new arbre(Float, Float_Put, Float_add);  -- Change to Float
use iarbre;

s : Float;  -- Change to Float
root : cellule_ptr;
n1, n2 : cellule_ptr;

begin
   ajouter_gauche(10.0, null, root);  -- Change to 10.0
   ajouter_gauche(11.0, root, n1);  -- Change to 11.0
   ajouter_gauche(12.0, n1, n2);  -- Change to 12.0
   ajouter_droit(13.0, n1, n2);  -- Change to 13.0
   ajouter_droit(20.0, root, n1);  -- Change to 20.0
   ajouter_droit(21.0, n1, n2);  -- Change to 21.0

   s := somme(root);
   put("s = "); put(s); new_line;
   put("arbre = "); put(root); new_line;
   put(root);
end marbre;
