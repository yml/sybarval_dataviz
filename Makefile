
_data_cache/igt_2016_global.csv:
	wget --output-document=$@ https://www.data.gouv.fr/fr/datasets/r/42279418-4e1f-4c8d-bea4-919af015ae20

_data_cache/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune.csv:
	wget --output-document=$@ "https://www.data.gouv.fr/fr/datasets/r/8f4d90b3-0fdc-42ec-97ce-e5992b4200a6"

_data_cache/igt_ademe_2016.csv:
	wget --output-document=$@ "https://data.ademe.fr/data-fair/api/v1/datasets/igt-pouvoir-de-rechauffement-global/full"

_data_cache/communes-nouvelle-aquitaine.geojson:
	wget --output-document=$@ "https://france-geojson.gregoiredavid.fr/repo/regions/nouvelle-aquitaine/communes-nouvelle-aquitaine.geojson"

_data_cache/voitures-par-commune-par-energie.geojson:
	wget --output-document=$@ "https://opendata.agenceore.fr/explore/dataset/voitures-par-commune-par-energie/download/?format=geojson&timezone=Europe/Berlin&lang=fr"


_data_cache/voitures-par-commune-par-energie.csv:
	wget --output-document=$@ "https://opendata.agenceore.fr/explore/dataset/voitures-par-commune-par-energie/download/?format=csv&timezone=Europe/Berlin&lang=fr&use_labels_for_header=true&csv_separator=%3B"

_data_cache/SYNTHESE_resultats_emissions_2018_IGT_d.xlsx:
	wget --output-document=$@ "https://www.citepa.org/wp-content/uploads/SYNTHESE_resultats_emissions_2018_IGT_d.xlsx"


.phony:populate_data_cache
populate_data_cache: _data_cache/igt_2016_global.csv _data_cache/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune.csv _data_cache/igt_ademe_2016.csv _data_cache/communes-nouvelle-aquitaine.geojson _data_cache/voitures-par-commune-par-energie.geojson _data_cache/voitures-par-commune-par-energie.csv _data_cache/SYNTHESE_resultats_emissions_2016_IGT_d.xlsx _data_cache/SYNTHESE_resultats_emissions_2018_IGT_d.xlsx

.phony: start_jupyter_server
start_jupyter_server:
	source .venv/bin/activate && jupyter server

.phony: install_python_deps
install_python_deps:
	python3 -m venv .venv && source .venv/bin/activate && poetry install
