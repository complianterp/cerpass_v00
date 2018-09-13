namespace complianterp.model;

    entity SideMain {
        key id       : String(2) not null;
            title    : String(50) not null;
            icon     : String(50);
            expanded : Boolean;
            viewname : String(30) not null;
            location : String(3) not null;
            sorting  : Integer not null;
            submenu  : association[0..*] to SideSubMenu on submenu.mainmenu = id;
    };

    entity SideSubMenu {
        key id          : String(4) not null;
        key mainmenu    : String(2) not null;
            title       : String(50) not null;
            viewname	: String(30) not null;
            sorting     : Integer not null;
    };

	view Fixed as
		select from SideMain as A
		{
			A.id,
			A.title,
			A.icon,
			A.expanded,
			A.viewname,
			A.location,
			A.sorting,
			A.submenu
		} where 
			  (	( (location) = 'fix' ) );
			  
	view Menu as
		select from SideMain as A
		{
			A.id,
			A.title,
			A.icon,
			A.expanded,
			A.viewname,
			A.location,
			A.sorting,
			A.submenu
		} where 
			  (	( (location) = 'dyn' ) );
		

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