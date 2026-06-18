# Sistema de Ventas - POSTGRESSQL

Este repositorio contiene el diseño, llenado y consultas de un sistema de ventas básico.

##  Diagrama de Entidad-Relación

A continuación se presenta el modelo de la base de datos generado automáticamente con Mermaid:

```mermaid
erDiagram
    CLIENTES ||--o{ VENTAS : "realiza"
    PRODUCTOS ||--o{ DETALLE_VENTA : "es_incluido"
    VENTAS ||--o{ DETALLE_VENTA : "contiene"

    CLIENTES {
        int id_cliente PK "GENERATED ALWAYS AS IDENTITY"
        varchar nombre "NOT NULL"
        varchar email "UK, NOT NULL"
    }

    PRODUCTOS {
        int id_producto PK "GENERATED ALWAYS AS IDENTITY"
        varchar nombre "NOT NULL"
        numeric precio "NOT NULL, CHECK > 0"
    }

    VENTAS {
        int id_venta PK "GENERATED ALWAYS AS IDENTITY"
        date fecha "NOT NULL"
        int id_cliente FK "NOT NULL (ON DELETE RESTRICT)"
    }

    DETALLE_VENTA {
        int id_detalle PK "GENERATED ALWAYS AS IDENTITY"
        int id_venta FK "NOT NULL (ON DELETE RESTRICT)"
        int id_producto FK "NOT NULL (ON DELETE RESTRICT)"
        int cantidad "NOT NULL, CHECK > 0"
    }
