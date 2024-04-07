with Ada.Text_IO; use Ada.Text_IO;
with lists; 

procedure Main is
    type note is new Float range 0.0 .. 20.0;
    package note_io is new Ada.Text_IO.Float_IO(note);
    use note_io;

    procedure Afficher_Note(E: in Note) is
    begin
        Put_Line(Note'Image(E));
    end Afficher_Note;

   package Ma_Liste is new Lists(note , Afficher_Note) ;
   use Ma_Liste ;

   Liste_Notes : Lien := null;
   Current_Note : Element_Ptr;

   
begin
   loop
      Put("Entrez une note (0.0 pour terminer) : ");

      Current_Note := new note;
      Get(Current_Note);

      exit when Current_Note = 0.0;

      if Current_Note > 20.0 or else Current_Note < 0.0 then
         Put_Line("Note invalide. Veuillez entrer une note entre 0.0 et 20.0.");
      else
         Ajouter(Liste_Notes, Current_Note);
      end if;
   end loop;

   -- Afficher les notes
   Afficher(Liste_Notes, Afficher_Note);
end Main;
