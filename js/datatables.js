	  $(document).ready(function() {
		    $('#articles').DataTable( { "pagingType": "full_numbers", "order": [[ 1, "asc" ]], "processing": true, "serverSide": true, "ajax": "ajax/chargement_articles.php",
		        "lengthMenu": [ 25, 50, 75, 100 ],
		        "language": {
	                "url": "js/dataTables.french.lang",
		             select: {

		               	rows: {

		                    _: "%d lignes sélectionnées",

		                    0: "",

		                    1: "1 ligne sélectionnée"

	               		}
	               	}
	            },
	            

	            select: {
		            style: 'single' //os pour multiple
		            //selector: 'td:not(:last-child)' // no row selection on last column
		        },
				"columnDefs": [
					{ "name" : "id", "visible": true, "targets": 0 },
					{ "name" : "id_tva","visible": true, "targets": 1 },
					{ "name" : "id_categorie","visible": true, "targets": 2  },
					{ "name" : "description",  "targets": 3 },
					{ "name" : "libelle",  "targets": 4 },
				    { "name" : "taux_tva","visible": true, "targets": 5  },
				    { "name" : "prix_unitaire_ht","visible": true, "targets": 6  },
				    { "name" : "prix_ttc","visible": true, "targets": 7  },
				    { "name" : "disponible","visible": true, "targets": 8  },
				    { "name" : "reduction","visible": true, "targets": 9  },

				  ],
				   rowCallback: function ( row, data ) {

		        	$('input.editor-active', row).prop( 'checked', data.active == 1 );

					}
		    	}
		     );

		});