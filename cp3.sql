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

create table empresa(
    id_empresa number not null,
    nombre_empresa varchar(20) not null,
    direccion_empresa_id_direccion number not null
);
alter table empresa add constraint empresa_pk primary key(id_empresa);

create table direccion_empresa(
    id_direccion number not null,
    direccion char not null,
    comuna_id_comuna number not null
);
alter table  direccion_empresa add constraint direccion_empresa-pk primary key(id_direccion);

create table afiliado(
    rut_afiliado char not null,
    nombres varchar(20) not null,
    apellidos varchar(20) not null,
    correo_electronico char not null,
    numero_carnet_socio number not null,
    fecha_nacimiento_afiliado date not null,
    empresa_id_empresa number not null
);
alter table afiliado add constraint afiliado_pk primary key(rut_afiliado);

create table pasaporte _afiliado(
    id_pasaporte number not null,
    numero_pasaporte_afiliado number not null,
    afiliado_rut_afiliado char not null
);
alter table pasaporte_afiliado add constraint pasaporte_afiliado_pk primary key(id_pasaporte);

create table direccion_afiliado(
    id_direccion number not null,
    comuna_id_comuna number not null,
    afiliado_rut_afiliado char not null,
    direccion_afiliado varchar(30) not null
);
alter table direccion_afiliado add constraint direccion_afiliado_pk primary key(id_direccion);

create table descuentos(
    id_descuento number not null,
    nombre varchar(20) not null,
    afiliado-rut-afiliado char not null
);
alter table descuentos add constraint descuento_pk primary key(id_descuentos);

create table tipo_descuento(
    id_descuento number not null,
    tipo_descuento varchar(20) not null
    cantidad_descuento number not null,
    uso_descuento number not null,
    fecha_uso date not null,
    descuentos_id_descuentos number not null
);
alter table tipo_descuento add constraint tipo_descuentos_pk primary key (id_descuento);

create table discapacidad_afiliado(
    id_discapacidad number not null,
    afiliado_rut_afiiliado char not null,
);
alter table discapaccidad_afiliado add constraint discapacidad_afiliado_pk primary key(id_discapacidad);

create table tipo_discapacidad(
    id_discapacidad number not null,
    tipo_discapacidad varchar(20) not null,
    discapacidad_afiliado_id_discapacidad number not null
);
alter table tipo_discapacidad add constraint tipo_discapacidad_pk primary key(id_discapacidad);

create table telefono_afiliado(
    id_telefono number not null,
    afiliado_rut_afiliado char not null
);
alter table telefono_Afiliado add constraint telefono_afiliado_pk primary key(id_telefono);

create table tipo_telefono_afiliado(
    id_telefono number not null,
    telefono_celular number not null,
    telefono_casa number not null,
    telefono_emergencia number not null,
    telefono_afiliado_id_telefono number not null
);
alter table tipo_telefono_afiliado add constraint tipo_telefono_afiliado_pk primary key(id_telefono);

create table aseguradora(
    id_aseguradora number not null,
    nombre varchar(20) not null,
    afiliado_rut_afiliado char not null
);
alter table aseguradora add constraint aseguradora_pk primary key(id_aseguradora);

create table vehiculo_afiliado(
    id_vehiculo number not null,
    patente_vehiculo char not null,
    marca_vehiculo varchar(20) not null,
    color_vehiculo varchar(20) not null,
    numero_chasis number not null,
    numero_motor number not null,
    tipo_vehiculo varchar(20) not null,
    aseguradora_id_aseguradora number not null
);
alter table vehiculo_afiliado add constraint  vehiculo_afiliado_pk primary key (id_vehiculo);

create table pago_arancel_afiliados(
    id_pago number not null,
    nombre_pago varchar(20) not null,
    afiliado_rut_afiliado char not null
);
alter table pago_arancel_afiliados add constraint pago_arancel_afiliado_pk primary key(id_pago);

create table medio_pago_arancel(
    id_pago number not null,
    medio_pago varchar(20) not null,
    cantidad_pagar number not null,
    banco_con_que_paga varchar(20) not null,
    pago_arancel_afiliados_id_pago number not null
);
alter table medio_pago_arancel add constraint medio_pago_arancel_pk primary key(id_pago);

create table cheque(
    id_pago number no null,
    numero_cheque number not null,
    banco varchar(15) not null,
    medio_pago_arancel_id_pago number not null
);
alter table cheque add constraint cheque_pk primary key(id_pago);

create table beneficios_afiliados(
    id_benefcio number not null,
    afiliado_rut_afiliado char not null,
);  
alter table beneficios_afiliados add constraint cheque_pk primary key(id_beneficio);

create table tipo_beneficio_afiliado();