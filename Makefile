
COMPONENTS=base mds mon osd rados radosgw rbd rbd-lock rbd-unlock rbd-volume

all: build

build:
	@$(foreach C, $(COMPONENTS), docker build -t ceph/$(C) $(C) &&) echo done
