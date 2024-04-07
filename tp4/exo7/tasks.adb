with Text_IO; use Text_IO;

procedure Tasks is

    task type element is
        entry afficher;    
    end element;

    task body element is
    begin
        loop
            accept afficher do
                Put_Line("Boom Boom ");
                delay 1.0;
            end afficher;
        end loop;

    end element;

tab_elements : array(1..10) of element;
e: element;

begin

    for i in 1..5 loop
            tab_elements(i).afficher;
    end loop;

end Tasks;