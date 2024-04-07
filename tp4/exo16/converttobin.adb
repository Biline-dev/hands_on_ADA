with Text_IO; use Text_IO;
WITH Ada.Integer_Text_IO ;    
USE Ada.Integer_Text_IO ;


procedure converttobin is

    --package  myint is new text_io.integer_io(integer); -- why package  
    --use myint;
    -- you can use the package above or this one : USE Ada.Integer_Text_IO ;
    -- that's why we use packages, it is for things like put, get, and image'


    type Etage; 
    type Etage_Ptr is access Etage; 

    task type Etage is
        entry Etage_Suivant (
            a_task : in     Etage_Ptr ); 
        entry Divise (
            Valeur : in     Natural ); 
    end Etage;


    task body Etage is 

        etg_svt : Etage_Ptr;
        i, j   : natural;  
        val    : natural;
    begin 
        accept etage_suivant (a_task : in etage_ptr ) do 
         etg_svt:=a_task;
        end etage_suivant;
            
        loop

         accept divise (
               Valeur : in Natural ) do 
			val:=Valeur;
	       
            i:= val mod 2;
            j:= val / 2;
            put(i);
            if j/=0
                then
                if etg_svt=null
                        then
                    put_line("Overflow");
                else
                    etg_svt.divise(j);
                end if;
            end if;
        end divise;
      end loop; 
    end Etage;

    
   nb        :          natural   := 1;  
   nb_etages : constant natural   := 8;  
   pipes,  
   previous  :          etage_ptr;  

   begin

   while nb<=nb_etages loop
      pipes:= new etage;
      pipes.etage_suivant(previous); -- didn't get this one
      previous:=pipes;
      nb:=nb+1;
   end loop;


   loop
      put("Number : ");
      get(nb);
      new_line;
      put( nb'img  & " in base 2 leads to ");
      pipes.divise(nb);
      delay 1.0;
      new_line;
   end loop;

    end ConvertToBin;
