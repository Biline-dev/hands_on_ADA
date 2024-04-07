package body lists is

    procedure Ajouter(L :  in out Lien; E: in Element_Ptr) is
        Nouveau : Lien;
    begin

        if(L=null)
            then 
                L :=  new Cellule;
                L.info := E;
            else
                Nouveau :=  new Cellule;
                Nouveau.info := E; 
                Nouveau.Suivant:=L; 
                L:=Nouveau;
        end if;
    end Ajouter;


    procedure Afficher(l: in Lien) is
        Courant : Lien:=L;
    begin
        while Courant/=null loop
            Afficher_un(Courant.info.all);
            Courant:= Courant.Suivant;
        end loop;
    end Afficher;


end lists;