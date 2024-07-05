INSERT INTO
  gama_producto (gama, descripcion_texto, descripcion_html, imagen)
VALUES
  (
    'ornamentales',
    'producto ornamental',
    'empresa.com/ornamental',
    'ornamental.jpg'
  ),
  (
    'frutales',
    'producto frutal',
    'empresa.com/frutal',
    'frutal.jpg'
  ),
  (
    'cocina',
    'producto de cocina',
    'empresa.com/cocina',
    'cocina.jpg'
  ),
  (
    'deportivos',
    'producto deportivo',
    'empresa.com/deportivo',
    'deportivo.jpg'
  ),
  (
    'oficina',
    'producto de oficina',
    'empresa.com/oficina',
    'oficina.jpg'
  ),
  (
    'arte',
    'producto de arte',
    'empresa.com/arte',
    'arte.jpg'
  );

INSERT INTO
  oficina (
    codigo_oficina,
    ciudad,
    pais,
    region,
    codigo_postal,
    telefono,
    linea_direccion1,
    linea_direccion2
  )
VALUES
  (
    'a-1',
    'bucaramanga',
    'colombia',
    'santander',
    '680001',
    '6524041',
    'carrera 50',
    '#80-11'
  ),
  (
    'a-2',
    'atlanta',
    'usa',
    'georgia',
    '30060',
    '112546',
    'boulevard mint',
    'double street'
  ),
  (
    'a-3',
    'fuenlabrada',
    'españa',
    'madrid',
    '28940',
    '5784596',
    'nazaret',
    '11'
  ),
  (
    'b-1',
    'toronto',
    'canada',
    'ontario',
    'M',
    '4578965',
    '284 king',
    'st w'
  ),
  (
    'b-2',
    'madrid',
    'españa',
    'madrid',
    '28001',
    '52469586',
    'calle de goya',
    'calle nuñez'
  );

INSERT INTO
  producto (
    codigo_producto,
    nombre,
    gama,
    dimensiones,
    proveedor,
    descripcion,
    cantidad_en_stock,
    precio_venta,
    precio_proveedor
  )
VALUES
  (
    'OR1523648',
    'caja ornamental',
    'ornamentales',
    '25cmx12cmx30cm',
    'xin_ping',
    'caja de ornamentos para ornamentar',
    120,
    105.20,
    35.00
  ),
  (
    'FR8456951',
    'banano de tela',
    'frutales',
    '25cmx5cmx7cm',
    'mi granjita',
    'banano hecho en tela de banano',
    241,
    12.69,
    3.56
  ),
  (
    'OR748596',
    'candelabro',
    'ornamentales',
    '70cmx35cmx50cm',
    'ice cold glass',
    'candelabro elegante para comedor',
    2,
    1500.00,
    450.69
  ),
  (
    'CO123456',
    'espatula',
    'cocina',
    '45cmx12cmx5cm',
    'grappy nuns',
    'espatula de acero',
    45,
    20.32,
    8.50
  ),
  (
    'AR159753',
    'brocha amplia',
    'arte',
    '12cmx8cmx3cm',
    'bob rosses',
    'brocha amplia para aplicar pintura',
    200,
    100.30,
    45.22
  ),
  (
    'OF741586',
    'lapiceros borrables',
    'oficina',
    '5cmx1cmx1cm',
    'scranton paper',
    'lapiceros con borrador para errores',
    120,
    7.30,
    1.80
  ),
  (
    'OR564578',
    'letrero led',
    'ornamentales',
    '25cmx12cmx5cm',
    'grappy nuns',
    'letrero programable led',
    173,
    49.99,
    12.65
  );

INSERT INTO
  empleado (
    codigo_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email,
    codigo_oficina,
    codigo_jefe,
    puesto
  )
VALUES
  (
    1,
    'jhon',
    'roa',
    'jaimes',
    '101',
    'jhon@roa.com',
    NULL,
    NULL,
    'CEO'
  ),
  (
    2,
    'juan',
    'rojas',
    'aguilar',
    '102',
    'juan@roj.com',
    NULL,
    NULL,
    'CTO'
  ),
  (
    3,
    'biarni',
    'eren',
    'angulo',
    '103',
    'biarni@eren.com',
    'a-3',
    1,
    'CFO'
  ),
  (
    4,
    'melissa',
    'mendoza',
    'perez',
    '201',
    'mel@issa.com',
    'b-1',
    1,
    'gerente de front-end'
  ),
  (
    11,
    'andres',
    'duarte',
    'jimenez',
    '202',
    'andres@duarte.com',
    'a-2',
    3,
    'gerente de ventas'
  ),
  (
    30,
    'juan',
    'paredes',
    'gamez',
    '301',
    'juan@paredes',
    'b-2',
    11,
    'representante de ventas'
  ),
  (
    32,
    'camila',
    'jimenez',
    'gonzales',
    '304',
    'cami@lala.com',
    'b-1',
    11,
    'representante de ventas'
  ),
  (
    33,
    'miguel',
    'angulo',
    'mejia',
    '404',
    'miguew@mej.com',
    'a-2',
    4,
    'programador front-end'
  );

INSERT INTO
  cliente (
    nombre_cliente,
    nombre_contacto,
    apellido_contacto,
    telefono,
    fax,
    linea_direccion1,
    linea_direccion2,
    ciudad,
    region,
    pais,
    codigo_postal,
    codigo_empleado_rep_ventas,
    limite_credito
  )
VALUES
  (
    'xin ping',
    'Numikura',
    'Takanada',
    '1299934',
    '+1299934',
    'zhengzou',
    'kuinlao',
    'Hong Kong',
    'hong kong',
    'china',
    '54238',
    30,
    201000.00
  ),
  (
    'mi granjita',
    'joel',
    'bravados',
    '32685878',
    '77777',
    'concepcion',
    'morriño',
    'cordoba',
    'extremadura',
    'españa',
    '243567',
    32,
    184000.45
  ),
  (
    'betabeles',
    'laura',
    'sosa',
    '3569857',
    '44425122',
    'av saratoga',
    'norquemada',
    'barcelona',
    'cataluña',
    'españa',
    '54321',
    11,
    36410.20
  ),
  (
    'grappy nuns',
    'tristan',
    'aguilar',
    '569854778',
    '66455584',
    'calle molineros',
    'nordicos',
    'badajoz',
    'extremadura',
    'españa',
    '584695',
    30,
    1524.12
  ),
  (
    'bob rosses',
    'axl',
    'rosses',
    '785744458',
    '222441545',
    'st lauren',
    '5177',
    'phoenix',
    'arizona',
    'usa',
    '230001',
    11,
    234159.11
  ),
  (
    'notarian jewerly',
    'sofia',
    'liskanova',
    '52645875',
    '854965',
    'calle 10',
    'carrera 20',
    'madrid',
    'madrid',
    'españa',
    '4511274',
    30,
    45213.45
  );

INSERT INTO
  pago (
    codigo_cliente,
    forma_pago,
    id_transaccion,
    fecha_pago,
    total
  )
VALUES
  (2, 'paypal', 'PP4152635', '2008-03-12', 1253.40),
  (1, 'visa', 'VS159785', '2008-05-30', 12000.12),
  (4, 'paypal', 'PP458748', '2008-03-12', 211000.12),
  (
    4,
    'mastercard',
    'MC451545',
    '2024-06-05',
    69032.00
  ),
  (
    3,
    'mastercard',
    'MC451879',
    '2012-08-05',
    5487.82
  ),
  (6, 'visa', 'VS96587', NULL, 6870.00);

INSERT INTO
  pedido (
    fecha_pedido,
    fecha_esperada,
    fecha_entrega,
    estado,
    comentarios,
    codigo_cliente
  )
VALUES
  (
    '2008-08-12',
    '2008-08-30',
    '2008-09-02',
    'entregado',
    'casa tras la roca',
    2
  ),
  (
    '2010-06-05',
    '2010-06-20',
    '2010-06-15',
    'entregado',
    '46 kilos de roca',
    3
  ),
  (
    '2023-12-31',
    '2024-08-20',
    NULL,
    'en camino',
    '22 plumas de ganso',
    1
  ),
  (
    '2024-06-05',
    NULL,
    NULL,
    'cancelado',
    'Error de plataforma',
    3
  ),
  (
    '2016-05-11',
    '2016-06-21',
    '2016-06-20',
    'entregado',
    'colchones desinflados',
    1
  ),
  (
    '2015-03-11',
    '2015-03-15',
    NULL,
    'en camino',
    'miel de nopal',
    1
  );

INSERT INTO
  detalle_pedido (
    codigo_pedido,
    codigo_producto,
    cantidad,
    precio_unidad,
    numero_linea
  )
VALUES
  (1, 'FR8456951', 4, 35, 2),
  (1, 'OF741586', 4, 45, 8),
  (3, 'OR1523648', 1, 450, 1),
  (2, 'OR748596', 5, 8, 3),
  (3, 'CO123456', 12, 3, 5);