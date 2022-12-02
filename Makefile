
_data_cache/igt_2016_global.csv:
	wget --output-document=$@ https://www.data.gouv.fr/fr/datasets/r/42279418-4e1f-4c8d-bea4-919af015ae20

_data_cache/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune.csv:
	wget --output-document=$@ "https://www.data.gouv.fr/fr/datasets/r/8f4d90b3-0fdc-42ec-97ce-e5992b4200a6"

_data_cache/igt_ademe_2016.csv:
	wget --output-document=$@ "https://data.ademe.fr/data-fair/api/v1/datasets/igt-pouvoir-de-rechauffement-global/full"

.phony:populate_data_cache
populate_data_cache: _data_cache/igt_2016_global.csv _data_cache/conso-elec-gaz-annuelle-par-secteur-dactivite-agregee-commune.csv _data_cache/igt_ademe_2016.csv


.phony: start_jupyter_server
start_jupyter_server:
	source .venv/bin/activate && jupyter server

.phony: install_python_deps
install_python_deps:
	python3 -m venv .venv && source .venv/bin/activate && poetry install
