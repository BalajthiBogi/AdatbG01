{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "CREATE TABLE Rendeles_maszk (\r\n",
                "    SORSZAM INT PRIMARY KEY,\r\n",
                "    LOGIN NVARCHAR(255) MASKED WITH (FUNCTION = 'email()') NULL,\r\n",
                "    REND_DATUM DATE NULL,\r\n",
                "    SZALL_DATUM DATE NULL,\r\n",
                "    SZALL_CIM NVARCHAR(255) MASKED WITH (FUNCTION = 'partial(1,\"XXXXXX\",1)') NULL,\r\n",
                "    SZALL_MOD NVARCHAR(255) MASKED WITH (FUNCTION = 'random([Ground],[Air],[Drone])') NULL,\r\n",
                "    FIZ_MOD NVARCHAR(255) NULL,\r\n",
                "    SZAMLA_CIM NVARCHAR(255) NULL\r\n",
                ");\r\n",
                "\r\n",
                "INSERT INTO Rendeles_maszk (SORSZAM, LOGIN, REND_DATUM, SZALL_DATUM, SZALL_CIM, SZALL_MOD, FIZ_MOD, SZAMLA_CIM)\r\n",
                "SELECT SORSZAM, LOGIN, REND_DATUM, SZALL_DATUM, SZALL_CIM, SZALL_MOD, FIZ_MOD, SZAMLA_CIM\r\n",
                "FROM Rendeles;\r\n",
                "\r\n",
                "CREATE USER masked_user WITHOUT LOGIN;\r\n",
                "\r\n",
                "GRANT SELECT ON Rendeles_maszk TO masked_user;\r\n",
                "\r\n",
                "SELECT * FROM Rendeles_maszk;"
            ],
            "metadata": {
                "azdata_cell_guid": "bfb993d4-0ff8-44ae-aaf5-23c2b7427a65",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        }
    ]
}