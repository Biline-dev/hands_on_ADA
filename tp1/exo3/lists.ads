generic 

    type Element is private;
    with procedure Afficher_Un(E: in Element);

package lists is

    type Element_Ptr is access Element;
    type Cellule is private;
    type Lien is access Cellule;

    procedure Afficher(L: in Lien);
    procedure Ajouter(L: in out Lien; E: Element_Ptr);

private
    type Cellule is record

        Suivant : lien;
        info : Element_Ptr;
        
    end record;

end lists;