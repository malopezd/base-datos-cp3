ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YY';

create table region (
    id_region number not null,
    nombre varchar (15) not null
);
alter table region add constraint region_pk primary key(id_region); 

create table provincia (
id_provincia number not null ,
nombre varchar (15) not null ,
region_id_region number not null
);
alter table provincia add constraint provincia_pk primary key(id_provincia);

create table comuna (
    id_comuna number not null ,
    nombre varchar (15) not null , 
    provincia_id_provincia number not null
);
alter table comuna add constraint comuna_pk primary key (id_comuna);

create table direcion_postulante(
    direccion varchar (20) not null ,
    comuna_id_comuna number not null
);
alter table direccion_postulante add constraint direccion_postulante_pk primary key(direccion);

create table postulante(
    rut_postulante number not null,
    nombres varchar(20) not null,
    apellidos varchar (20) not null ,
    genero varchar (15) not null ,
    adjunto_cv varchar (2) not null ,
    pretencion_sueldo number not null ,
    correo_electronico char(50) not null ,
    nacionalidad varchar(20) not null ,
    solicitud_ingreso_id_solicitud number not null ,
    solicitud_ingreso_empresa_id_empresa number not null , 
    direccion_postulante_direccion varchar(50) not null
);
alter table postulante add constraint postulante_pk primary key (rut_postulante);

create table paasaporte_postulante(
    id_pasaporte number not null,
    numero_pasaporte number not null,
    nacionalidad varchar(15) not null,
    pustalante_rut_postulante char not null
);
alter table postulante add constraint postulante_pk primary key(id_pasaporte);

create table discapacidad_postulante(
    rut_postulante char not null,
    id_discapacidad number not null,
    postulante_rut_postulante char not null
);
alter table postulante add constraint postulante_pk primary key (rut_postulante);

create table tipo_discapaccidad_postulante(
    rut_postulante char not null,
    id_discapacidad number not null,
    cuenta_con_discapacidad varchar(2) not null,
    tipo_dicapacidad varchar(15) not null,
    discapacidad_postulante_rut_postulante char not null,
);
alter table tipo_discapacidad_postulante add constraint tipo_discapacidad_postulante_pk primary key(rut_postulante,id_discapacidad)

create table telefonos_postulantes(
    telefono-id_telefono number not null,
    postulante_rut_postulante char not null
);
alter table telefonos_postulantes add constraint telefonos_postulantes_pk primary key(id_telefono);

create table telefono(
    id_telefono number not null,
    nombre varchar(20) not null,
    tipo_telefono_id_tipo_telefono number not null
);
alter table telefono add constraint telefono_pk primary key(id_telefono);

create table tipo_telefono(
    id_tipo_telefono number not null,
    nombre varchar(20) not null
);
alter table tipo_telefono add constraint tipo_telefono_pk primary key (id_tipo_telefono);

create table solicitud_ingreso(
    id_solicitud number not null,
    hora_solicitud time not null,
    fecha_solicitud date not null,
    empresa_id_empresa number not null
);
alter table solicitud_ingreso add constraint solicitud_ingreso_pk primary key (id_solicitud,empresa_id_empresa);

create table();