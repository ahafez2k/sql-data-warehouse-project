/*
==================================================================
CREATE DATABASE 
==================================================================
Script Purpose:
    This script creates a new database called 'data_warehouse' after checking if it already exists.
    If the database exists, it drops it and recreates it.

WARNING:
    Running this script will drop the entire 'data_warehouse' database if it exists.
    All data in the database will be permanently deleted.
    So, before running it, make sure you are ok with this data being deleted or ensure you have a backup.
    DROP DATABASE: "DO NOT RUN IN PRODUCTION" this is just for development and project setup.
*/

DROP DATABASE IF EXISTS data_warehouse WITH (FORCE);
CREATE DATABASE data_warehouse;
