# Makefile

# Updated: <2023-09-15 16:12:09 david.hisel>

build:
	podman build -t punt:latest -f Dockerfile

nocache-build:
	podman build --no-cache -t punt:latest -f Dockerfile

MigrationPlatform.zip: paspolicy/Policy-MigrationPlatform.xml paspolicy/Policy-MigrationPlatform.ini
	(cd paspolicy && zip ../MigrationPlatform.zip Policy-MigrationPlatform.ini Policy-MigrationPlatform.xml)

clean:
	rm -f MigrationPlatform.zip
