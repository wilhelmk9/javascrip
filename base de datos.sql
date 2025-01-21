-- Crear la base de datos
CREATE DATABASE TiendaOnline;

-- Usar la base de datos
USE TiendaOnline;

-- Crear la tabla de categorias
CREATE TABLE categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- Crear la tabla de productos
CREATE TABLE productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Crear la tabla de ventas
CREATE TABLE ventas (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cantidad_vendida INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);


INSERT INTO ventas (producto_id, cantidad_vendida) VALUES
(1, 50), -- Smartphone
(2, 30), -- Laptop
(3, 40), -- Tablet
(4, 20), -- Silla
(5, 10), -- Escritorio
(6, 25), -- Camiseta
(7, 35), -- Zapatos
(8, 15), -- Muñeca
(9, 5);  -- Pelota

SELECT 
    c.nombre_categoria AS categoria, 
    SUM(v.cantidad_vendida) AS total_vendido
FROM 
    ventas v
INNER JOIN 
    productos p ON v.producto_id = p.producto_id
INNER JOIN 
    categorias c ON p.categoria_id = c.categoria_id
GROUP BY 
    c.nombre_categoria
ORDER BY 
    total_vendido DESC
LIMIT 10;
