with garbre;
with text_io;
use text_io;

procedure mgarbre is 

package io is new integer_io(integer);
use io;

procedure puti(e : in integer) is 
begin
	put(e);
end puti;

function sommei(e1 : in integer; e2 : in integer) 
        return integer is 
begin
	return e1+e2;
end sommei;


package iarbre is new garbre(integer, puti, sommei);
use iarbre;



s : integer;
root : cellule_ptr;
n1, n2 : cellule_ptr;

begin
	ajouter_gauche(10, null, root);
    ajouter_gauche(11, root, n1);
    ajouter_gauche(12, n1, n2);
    ajouter_gauche(13, n2, n1);
    ajouter_droit(20, root, n1);
    ajouter_droit(21, n1, n2);

	s:=somme(root);
	put("s = "); put(s); new_line;
	put("arbre = "); put(root); new_line;
end mgarbre;


