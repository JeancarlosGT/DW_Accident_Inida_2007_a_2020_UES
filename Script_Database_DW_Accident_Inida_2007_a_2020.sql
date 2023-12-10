/*==============================================================*/
/* Table: DIMACCIDENTTYPE                                       */
/*==============================================================*/
create table DIMACCIDENTTYPE (
   ACCIDENTTYPEKEY      int                  not null,
   ACCIDENTTYPEID       int                  null,
   TYPE                 char(25)             null,
   constraint PK_DIMACCIDENTTYPE primary key (ACCIDENTTYPEKEY)
)
go



/*==============================================================*/
/* Table: DIMLOCATION                                           */
/*==============================================================*/
create table DIMLOCATION (
   LOCATIONKEY          int                  not null,
   LOCATIONID           int                  null,
   STATE                char(50)             null,
   constraint PK_DIMLOCATION primary key (LOCATIONKEY)
)
go

/*==============================================================*/
/* Table: DIMTIME                                               */
/*==============================================================*/
create table DIMTIME (
   TIMEKEY              int                  not null,
   TIMEID               int                  null,
   
   YEAR                 int                  null,
   MONTH                char(25)             null,
   DAY                  char(25)             null,
   
   constraint PK_DIMTIME primary key (TIMEKEY)
)
go





/*==============================================================*/
/* Table: FACTACCIDENTINDIA                                     */
/*==============================================================*/
create table FACTACCIDENTINDIA (
   ACCIDENTINDIAKEY     int                  not null,
   ACCIDENTTYPEKEY      int                  null,
  LOCATIONKEY          int                  null,
   TIMEKEY              int                  null,
FEMALE_VICTIM int                  null,
  MALE_VICTIM int                  null,
  AGE_FEMALE_16_18 int                  null,
  AGE_FEMALE_19_40 int                  null,
  AGE_FEMALE_41_65 int                  null,
  AGE_MALE_16_18 int                  null,
  AGE_MALE_19_40 int                  null,
  AGE_MALE_41_65 int                  null,
  VEHICLE_TRUCK int                  null,
  VEHICLE_PICKUP int                  null,
  VEHICLE_COLLECTIVE int                  null,
  VEHICLE_SEDAN int                  null,
  ACCIDENT_FACT_MOBILE int                  null,
  ACCIDENT_FACT_DANGEROUS_DRIVING int                  null,
  ACCIDENT_FACT_WEATHER_CONDITIONS int                  null,
  ACCIDENT_FACT_DISTRACTED_DIVING int                  null,
  ACCIDENT_FACT_LACK_OF_ROAD_SIGNAGE int                  null,
  ACCIDENT_FACT_ROADS_CONDITION int                  null,
  TOTAL_VICTIM int                  null,

   constraint PK_FACTACCIDENTINDIA primary key (ACCIDENTINDIAKEY)
)
go







/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_3_FK on FACTACCIDENTINDIA (TIMEKEY ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_4_FK on FACTACCIDENTINDIA (LOCATIONKEY ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/




create nonclustered index RELATIONSHIP_5_FK on FACTACCIDENTINDIA (ACCIDENTTYPEKEY ASC)
go




alter table FACTACCIDENTINDIA
   add constraint FK_FACTACCI_RELATIONS_DIMTIME foreign key (TIMEKEY)
      references DIMTIME (TIMEKEY)
go

alter table FACTACCIDENTINDIA
   add constraint FK_FACTACCI_RELATIONS_DIMLOCAT foreign key (LOCATIONKEY)
      references DIMLOCATION (LOCATIONKEY)
go

alter table FACTACCIDENTINDIA
   add constraint FK_FACTACCI_RELATIONS_DIMACCID foreign key (ACCIDENTTYPEKEY)
      references DIMACCIDENTTYPE (ACCIDENTTYPEKEY)
go