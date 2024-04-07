generic 
  type element is private;
  with procedure Put_element(e : in element);
  with function  add(e1 : in element; e2 : in element)
       return element;

package arbre is 

  type cellule;
  type cellule_ptr is access cellule;

  type cellule is record
    information : element;
    gauche      : cellule_ptr;
    droit       : cellule_ptr;
  end record;


  procedure ajouter_gauche(e : in element ; pere : in cellule_ptr; noeud : out cellule_ptr);
  procedure ajouter_droit(e : in element ; pere : in cellule_ptr; noeud : out cellule_ptr);
  function somme (noeud : in cellule_ptr) return element;
  procedure put  (noeud : in cellule_ptr);

end arbre;


