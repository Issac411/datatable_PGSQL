<?php
 
/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simply to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
 
// DB table to use
$table = 'articles';
 
// Table's primary key
$primaryKey = 'id';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    array( 'db' => 'id', 'dt' => 0),
    array( 'db' => 'id_tva', 'dt' => 1),
    array( 'db' => 'id_categorie', 'dt' => 2),
    array( 'db' => 'libelle', 'dt' => 3),
    array( 'db' => 'description', 'dt' => 4),
    array( 'db' => 'taux_tva', 'dt' => 5),
    array( 'db' => 'prix_unitaire_ht', 'dt' => 6),
    array( 'db' => 'prix_ttc', 'dt' => 7),
    array( 'db' => 'disponible', 'dt' => 8),
    array( 'db' => 'reduction', 'dt' => 9)

    );
// SQL server connection information
$sql_details = array(
    'eng' => 'pgsql',
    'user' => '',
    'pass' => '',
    'db'   => '',
    'host' => ''
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( 'ssp_articles.php' );
 
echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
);