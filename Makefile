
.PHONY: test
test:
	tox

.PHONY: clean
clean:
	find -name '*.pyc' -delete
	find -name '__pycache__' -delete

.PHONY: publish
publish:
	rm -fr build dist .egg termination_handler.egg-info
	pip install wheel twine
	python3 setup.py sdist bdist_wheel
	twine upload dist/*
	rm -fr build dist .egg termination_handler.egg-info
	
.PHONY: super-clean
super-clean: clean
	rm -rf .tox
	rm -rf venv
	pyenv local --unset