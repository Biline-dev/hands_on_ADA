-- angles.ads (Specification)
package angles is

    PI : constant Float := 3.14;
    type angle_degre is new Integer range 1 .. 360;
    type angle_radian is new float range 0.0 .. PI; -- 0.01 apres la virgule, au max 4 comme caleur

    procedure Get_deg( Angle : out angle_degre) ;
    procedure Get_rad( Angle : out angle_radian) ;

    procedure Put_deg( Angle : angle_degre ) ;
    procedure Put_rad( Angle : angle_radian ) ;

end angles;