namespace complianterp.model;

    entity SideMain {
        key id       : Integer;
            title    : String(50);
            icon     : String(50);
            expanded : Boolean;
            submenu  : association[0..*] to SideSubMenu on submenu.mainmenu = id;
    };

    entity SideSubMenu {
        key id          : Integer not null;
        key mainmenu    : Integer not null;
            title       : String(50);
    };

    /*@@LAYOUT{"LAYOUTINFO":{"X":348,"Y":-45.5}}*/
    entity MODULE {
        key MODULE_ID     : String(10) not null;
            MODULE_NAME   : String(60) not null;
            TO_SUB_MODULE : association[0..*] to SUB_MODULE on TO_SUB_MODULE.MODULE_ID = MODULE_ID; /*OUT*/
    };

    /*@@LAYOUT{"LAYOUTINFO":{"X":718,"Y":-93.5}}*/
    entity SUB_MODULE {
        key MODULE_ID       : String(10) not null; /*ASSOCIATION*/
        key SUB_MODULE_ID   : String(10) not null;
            SUB_MODULE_NAME : String(60) not null;
            TO_MODULE       : association[1] to MODULE   on TO_MODULE.MODULE_ID = MODULE_ID; /*IN*/
    };