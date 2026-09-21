# Resumen del Laboratorio 03: Manipulación de Datos JSON en SQL Server

Este laboratorio demuestra cómo trabajar con datos estructurados en formato JSON utilizando Transact-SQL (T-SQL) sobre la base de datos de ejemplo `SalesLT.Product`.

---

## 1. Generación de Salidas JSON (`FOR JSON PATH`)
Permite transformar los resultados relacionales de una consulta SQL en una estructura de texto JSON.
* **Uso básico:** Añadir `FOR JSON PATH` al final de la consulta convierte las filas en objetos JSON planos.
* **Estructuras anidadas:** Es posible utilizar funciones como `JSON_OBJECT()` dentro de la consulta para agrupar campos relacionados (por ejemplo, anidar la categoría dentro de los datos del producto).

---

## 2. Combinación con CTEs y Funciones de Ventana
Se pueden combinar consultas avanzadas con la serialización JSON.
* **CTEs (Common Table Expressions):** Permiten crear conjuntos de resultados temporales.
* **Funciones de ventana (`ROW_NUMBER()`):** Útiles para particionar y ordenar datos (por ejemplo, para obtener los 3 productos más caros de cada categoría usando `PARTITION BY`).
* **Raíz personalizada (`ROOT`):** Añadir `FOR JSON PATH, ROOT('NombreDeLaRaiz')` permite envolver todo el resultado JSON bajo un nodo raíz específico.

---

## 3. Análisis y Parseo de JSON (`OPENJSON`)
Permite tomar datos JSON externos (como una variable o cadena de texto) y convertirlos en un conjunto de filas relacional para realizar consultas o uniones (`JOIN`).
* **Función `OPENJSON` con cláusula `WITH`:** Define explícitamente el esquema de los datos JSON que se desean extraer, especificando tipos de datos (como `INT` o `DECIMAL`) y las rutas de las propiedades (ej. `\$.ProductID`).
* **Utilidad práctica:** Facilita comparar precios actuales con actualizaciones masivas enviadas en formato JSON, calculando diferencias de precios directamente en la consulta.
